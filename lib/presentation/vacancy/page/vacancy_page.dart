import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/presentation/connectivity/bloc/bloc/connectivity_bloc.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';
import 'package:mini_project_alfath/presentation/vacancy/bloc/bloc/work_bloc.dart';
import 'package:mini_project_alfath/presentation/vacancy/page/detail_vacancy_page.dart';
import 'package:mini_project_alfath/presentation/vacancy/widget/card_job_vacancy_widget.dart';
import 'package:mini_project_alfath/presentation/vacancy/widget/search_job_vacancy_widget.dart';


class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isSearchVisible = true;
  double _lastOffset = 0.0;
  late final PagingController<int, Datum> _pagingController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);

    _pagingController = PagingController<int, Datum>(
      // fungsi ini menentukan page berikutnya
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      // fungsi ini dipanggil otomatis saat page diminta
      fetchPage: (pageKey) async {
        final bloc = context.read<WorkBloc>();
        final result = await bloc.service.getActiveJobs(
          page: pageKey,
          minimalGaji: 0,
          maksimalGaji: 0,
          jenis: 'Nasional',
        );

        return result.fold(
          (error) => throw Exception(error),
          (data) => data.data,
        );
      },
    );

    // context.read<WorkBloc>().add(
    //   const WorkEvent.fetchJobs(
    //     page: 1,
    //     minimalGaji: 0,
    //     maksimalGaji: 0,
    //     jenis: 'Nasional',
    //   ),
    // );
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
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox();
          },
          connected: () {
            return Scaffold(
              backgroundColor: AppColors.colorGeneralWhite,
              appBar: AppBar(
                title: Text(
                  'Lowongan Pekerjaan',
                  style: ThemeConfig.titleMedium.copyWith(
                    fontSize: AppSizes.s18,
                  ),
                ),
                backgroundColor: AppColors.colorGeneralWhite,
                // elevation: _isSearchVisible ? 4 : 0,
              ),
              body: 
             Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: _isSearchVisible ? 70 : 0,
                      curve: Curves.easeInOut,
                      child: _isSearchVisible
                          ? SearchJobVacancyWidget(
                              controller: TextEditingController(),
                              onTap: () {},
                            )
                          : const SizedBox.shrink(),
                    ),
                    Expanded(
                      // gunakan ValueListenableBuilder untuk listen state
                      child: ValueListenableBuilder<PagingState<int, Datum>>(
                        valueListenable: _pagingController,
                        builder: (context, state, _) {
                          return PagedListView<int, Datum>(
                            state: state,
                            fetchNextPage: _pagingController.fetchNextPage,
                            // scrollController: controller,
                            builderDelegate:
                                PagedChildBuilderDelegate<Datum>(
                              itemBuilder: (context, job, index) {
                                return CardJobVacancyWidget(
                                  title: job.pekerjaan.nama,
                                  type: job.pekerjaan.tipe ?? '-',
                                  companyName: job.perusahaan?.nama ?? '-',
                                  location:
                                      'asdas',
                                  postedDate: 'asdas',
                                  status: job.pekerjaan.isApply
                                      ? 'Applied'
                                      : 'Open',
                                  onTap: () {
                                    context.push(const DetailVacancyPage());
                                  },
                                );
                              },
                              firstPageProgressIndicatorBuilder: (_) =>
                                  const Center(
                                      child: CircularProgressIndicator()),
                              newPageProgressIndicatorBuilder: (_) =>
                                  const Center(
                                      child: CircularProgressIndicator()),
                              noItemsFoundIndicatorBuilder: (_) =>
                                  const Center(
                                      child:
                                          Text('Tidak ada lowongan ditemukan')),
                              firstPageErrorIndicatorBuilder: (_) =>
                                  const Center(
                                      child: Text('Gagal memuat data')),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          disconnected: () {
            return const ErrorPage();
          },
        );
      },
    );
  }
}


