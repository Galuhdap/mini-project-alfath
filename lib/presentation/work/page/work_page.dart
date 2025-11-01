import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/component/dialog/show_bottom_dialog.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/presentation/work/bloc/work/work_bloc.dart';
import 'package:mini_project_alfath/presentation/work/widget/list/work_vacancy_list.dart';
import 'package:mini_project_alfath/presentation/work/widget/search_work_vacancy_widget.dart';
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
        final bloc = context.read<WorkBloc>();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _isSearchVisible ? 70 : 0,
              curve: Curves.easeInOut,
              child: _isSearchVisible
                  ? SearchJobVacancyWidget(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                        _pagingController.refresh();
                      },
                      onTap: () {
                        showModalBottom(
                          context,
                          ShowModalBottomFilterWidget(
                            selectedTipeBottom: _selectedTipeBottom,
                            selectedMinValue: _selectedMinValue,
                            selectedMaxValue: _selectedMaxValue,
                            selectedTipeList: selectedTipeList,
                            salaryItems:
                                items,
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
                    )
                  : const SizedBox.shrink(),
            ),
            WorkVacancyListView(
              scrollController: _scrollController,
              pagingController: _pagingController,
            ),
          ],
        ),
      ),
    );
  }
}
