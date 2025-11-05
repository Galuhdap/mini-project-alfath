import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/dialog/show_bottom_dialog.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';
import 'package:mini_project_alfath/presentation/work/bloc/bloc/working_bloc.dart';
import 'package:mini_project_alfath/presentation/work/page/detail_work_page.dart';
import 'package:mini_project_alfath/presentation/work/widget/card_work_vacancy_widget.dart';
import 'package:mini_project_alfath/presentation/work/widget/search_work_vacancy_widget.dart';
import 'package:mini_project_alfath/presentation/work/widget/shimmer/work_simmer.dart';
import 'package:mini_project_alfath/presentation/work/widget/show_modal_bottom_widget.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isSearchVisible = true;
  double _lastOffset = 0.0;
  late final PagingController<int, Datum> _pagingController;
  TextEditingController searchController = TextEditingController();

  String? _searchQuery;
  String? _selectedTipeBottom;
  String? _selectedMinValue;
  String? _selectedMaxValue;
  int? _minSalary;
  int? _maxSalary;
  List<int> selectedTipeList = [];
  String? _selectedJobType;
  Timer? _debounce;

  final List<String> items = [
    'Rp. 0 Jt',
    'Rp. 1 Jt',
    'Rp. 2 Jt',
    'Rp. 3 Jt',
    'Rp. 5 Jt',
    'Rp. 10 Jt',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);

    _pagingController = PagingController<int, Datum>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final bloc = context.read<WorkingBloc>();
        final result = await bloc.service.getActiveJobs(
          page: pageKey,
          minimalGaji: _minSalary ?? 0,
          maksimalGaji: _maxSalary ?? 0,
          jenis: _selectedJobType ?? 'Nasional',
          search: _searchQuery ?? '',
          tipe: selectedTipeList,
        );

        return result.fold(
          (left) {
            throw Exception(left);
          },
          (right) {
            final list = right.data;
            return list;
          },
        );
      },
    );
  }

  void _handleScroll() {
    final offset = _scrollController.offset;

    if (offset > _lastOffset && offset - _lastOffset > 5) {
      if (_isSearchVisible) {
        setState(() => _isSearchVisible = false);
      }
    } else if (offset < _lastOffset && _lastOffset - offset > 5) {
      if (!_isSearchVisible) {
        setState(() => _isSearchVisible = true);
      }
    }

    _lastOffset = offset;
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGeneralWhite,
      appBar: AppBar(
        title: Text(
          'Lowongan Pekerjaan',
          style: ThemeConfig.titleMedium.copyWith(fontSize: AppSizes.s18),
        ),
        backgroundColor: AppColors.colorGeneralWhite,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
          
            title: PreferredSize(
              //preferredSize: Size.fromHeight(_isSearchVisible ? 70 : 14),
              preferredSize: const Size.fromHeight(70),
              child: ClipRRect(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isSearchVisible ? 70 : 0,
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isSearchVisible ? 1 : 0,
                    child: _isSearchVisible
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: SearchJobVacancyWidget(
                              controller: searchController,
                              onChanged: (value) {
                                if (_debounce?.isActive ?? false)
                                  _debounce!.cancel();
                                _debounce = Timer(
                                  const Duration(milliseconds: 600),
                                  () {
                                    setState(() {
                                      _searchQuery = value;
                                    });
                                    _pagingController.refresh();
                                  },
                                );
                              },
                              onTap: () {
                                showModalBottom(
                                  context,
                                  ShowModalBottomFilterWidget(
                                    selectedTipeBottom: _selectedTipeBottom,
                                    selectedMinValue: _selectedMinValue,
                                    selectedMaxValue: _selectedMaxValue,
                                    selectedTipeList: selectedTipeList,
                                    salaryItems: items,
                                    onFilterApplied:
                                        ({
                                          required tipeBottom,
                                          required minValue,
                                          required maxValue,
                                          required tipeList,
                                          required minSalary,
                                          required maxSalary,
                                        }) {
                                          setState(() {
                                            _selectedTipeBottom = tipeBottom;
                                            _selectedMinValue = minValue;
                                            _selectedMaxValue = maxValue;
                                            selectedTipeList = tipeList;
                                            _minSalary = minSalary;
                                            _maxSalary = maxSalary;
                                          });
                                          _pagingController.refresh();
                                        },
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ),

          // ganti SliverPadding yang lama dengan ini:
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: PagingListener<int, Datum>(
              controller: _pagingController,
              builder: (context, state, fetchNextPage) {
                return PagedSliverList<int, Datum>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Datum>(
                    itemBuilder: (context, job, index) {
                      return CardWorkVacancyWidget(
                        title: job.pekerjaan.nama,
                        type: job.pekerjaan.tipe,
                        companyName: job.perusahaan.nama,
                        location: job.pekerjaan.lokasi,
                        postedDate: job.pekerjaan.createdAt.toString(),
                        status: job.pekerjaan.isApply ? 'Applied' : 'Open',
                        onTap: () {
                          context.push(
                            DetailWorkPage(jobKey: job.pekerjaan.key),
                          );
                        },
                      );
                    },
                    firstPageProgressIndicatorBuilder: (_) => SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (_, __) => const WorkShimmerWidget(),
                      ),
                    ),
                    newPageErrorIndicatorBuilder: (_) => Center(
                      child: IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.blue),
                        onPressed: () => fetchNextPage(),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) => Center(
                      child: ErrorPage(
                        isNoConnection: false,
                        message: 'Lowongan yang dicari tidak ada',
                        image: Assets.images.error404.path,
                      ),
                    ),
                    firstPageErrorIndicatorBuilder: (_) => Center(
                      child: ErrorPage(
                        message:
                            'Terdapat kesalahan pada server. Silakan muat ulang!',
                        image: Assets.images.error504.path,
                        onPressed: () => fetchNextPage(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
