import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/component/dialog/show_bottom_dialog.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/extensions/parse_selary_ext.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';
import 'package:mini_project_alfath/presentation/work/bloc/work/work_bloc.dart';
import 'package:mini_project_alfath/presentation/work/page/detail_work_page.dart';
import 'package:mini_project_alfath/presentation/work/widget/card_job_vacancy_widget.dart';
import 'package:mini_project_alfath/presentation/work/widget/card_type_work_widget.dart';
import 'package:mini_project_alfath/presentation/work/widget/shimmer/work_simmer.dart';
import 'package:mini_project_alfath/presentation/work/widget/search_job_vacancy_widget.dart';

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
  // String? _selectedTipeBottom; // FullTime, PartTime, Internship
  String? _selectedTipeBottom;
  String? _selectedMinValue;
  String? _selectedMaxValue;
  int? _minSalary;
  int? _maxSalary;
  List<int> selectedTipeList = []; // untuk menyimpan tipe numerik (['1','2'])
  String? _selectedJobType;

  // dropdown items
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
      // fungsi ini menentukan page berikutnya
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
                        _pagingController.refresh(); // panggil ulang data
                      },
                      onTap: () {
                        showModalBottom(
                          context,
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppSizes.s24,
                              right: AppSizes.s24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSizes.s24.height,
                                Text(
                                  'Tipe pekerjaan',
                                  style: ThemeConfig.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                AppSizes.s12.height,
                                StatefulBuilder(
                                  builder: (context, setModalState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CardTypeWorkWidget(
                                              label: 'Semua',
                                              isSelected:
                                                  _selectedTipeBottom ==
                                                  'Semua',
                                              onTap: () {
                                                setModalState(() {
                                                  _selectedTipeBottom = 'Semua';
                                                  selectedTipeList = [
                                                            
                                                          ]; // semua tipe
                                                });
                                              },
                                            ),
                                            AppSizes.s8.width,
                                            CardTypeWorkWidget(
                                              label: 'FullTime',
                                              isSelected:
                                                  _selectedTipeBottom ==
                                                  'FullTime',
                                              onTap: () {
                                                setModalState(() {
                                                  _selectedTipeBottom =
                                                      'FullTime';
                                                  selectedTipeList = [1];
                                                });
                                              },
                                            ),
                                            AppSizes.s8.width,
                                            CardTypeWorkWidget(
                                              label: 'PartTime',
                                              isSelected:
                                                  _selectedTipeBottom ==
                                                  'PartTime',
                                              onTap: () {
                                                setModalState(() {
                                                  _selectedTipeBottom =
                                                      'PartTime';
                                                  selectedTipeList = [2];
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        AppSizes.s8.height,
                                        SizedBox(
                                          width: 120,
                                          child: CardTypeWorkWidget(
                                            label: 'Internship',
                                            isSelected:
                                                _selectedTipeBottom ==
                                                'Internship',
                                            onTap: () {
                                              setModalState(() {
                                                _selectedTipeBottom =
                                                    'Internship';
                                                selectedTipeList = [3];
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                AppSizes.s20.height,
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gaji Minimal',
                                            style: ThemeConfig.bodyMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          AppSizes.s12.height,
                                          DropdownButtonFormField<String>(
                                            value: _selectedMinValue,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                            ),
                                            hint: const Text("Rp. 0"),
                                            items: items.map((value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedMinValue = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppSizes.s20.width,
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gaji Maksimal',
                                            style: ThemeConfig.bodyMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          AppSizes.s12.height,
                                          DropdownButtonFormField<String>(
                                            value: _selectedMaxValue,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                            ),
                                            hint: const Text("Rp. 0"),
                                            items: items.map((value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedMaxValue = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                AppSizes.s20.height,
                                Button.filled(
                                  height: AppSizes.s45,
                                  borderRadius: AppSizes.s12,
                                  onPressed: () {
                                    setState(() {
                                      _minSalary = parseSalary(
                                        _selectedMinValue,
                                      );
                                      _maxSalary = parseSalary(
                                        _selectedMaxValue,
                                      );
                                    });
                                    _pagingController.refresh();
                                    context.pop();
                                  },
                                  label: 'Filter',
                                ),
                                AppSizes.s20.height,
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ),
            Expanded(
              child: ValueListenableBuilder<PagingState<int, Datum>>(
                valueListenable: _pagingController,
                builder: (context, state, _) {
                  return PagedListView<int, Datum>(
                    scrollController: _scrollController,
                    state: state,
                    fetchNextPage: _pagingController.fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate<Datum>(
                      itemBuilder: (context, job, index) {
                        return CardJobVacancyWidget(
                          title: job.pekerjaan.nama,
                          type: job.pekerjaan.tipe,
                          companyName: job.perusahaan.nama,
                          location: job.pekerjaan.lokasi.name,
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
                      // newPageProgressIndicatorBuilder: (_) => SizedBox(
                      //   width: 200.0,
                      //   height: 100.0,
                      //   child: ListView.builder(
                      //     itemCount: 5,
                      //     itemBuilder: (context, index) =>
                      //         const WorkShimmerWidget(),
                      //   ),
                      // ),
                      newPageErrorIndicatorBuilder: (_) => Center(
                        child: IconButton(
                          icon: const Icon(Icons.refresh, color: Colors.blue),
                          onPressed: () {
                            _pagingController.refresh();
                          },
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: ErrorPage(
                          isNoConnection: false,
                          message: 'Lowongan sudah dihapus atau tidak tersedia',
                          image: Assets.images.error404.path,
                        ),
                      ),

                      firstPageErrorIndicatorBuilder: (_) => Center(
                        child: ErrorPage(
                          message:
                              'Terdapat kesalahan pada server. Silakan muat ulang!',
                          image: Assets.images.error504.path,
                          onPressed: () {
                            _pagingController.refresh();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
