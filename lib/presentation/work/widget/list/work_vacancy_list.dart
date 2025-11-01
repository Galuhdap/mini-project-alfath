
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';
import 'package:mini_project_alfath/presentation/work/page/detail_work_page.dart';
import 'package:mini_project_alfath/presentation/work/widget/card_work_vacancy_widget.dart';
import 'package:mini_project_alfath/presentation/work/widget/shimmer/work_simmer.dart';

class WorkVacancyListView extends StatelessWidget {
  final ScrollController scrollController;
  final PagingController<int, Datum> pagingController;

  const WorkVacancyListView({
    super.key,
    required this.scrollController,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<PagingState<int, Datum>>(
        valueListenable: pagingController,
        builder: (context, state, _) {
          return PagedListView<int, Datum>(
            padding: EdgeInsets.only(top: AppSizes.s5),
            scrollController: scrollController,
            state: state,
            fetchNextPage: pagingController.fetchNextPage,
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
                    context.push(DetailWorkPage(jobKey: job.pekerjaan.key));
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
                  onPressed: () {
                    pagingController.refresh();
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
                    pagingController.refresh();
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
