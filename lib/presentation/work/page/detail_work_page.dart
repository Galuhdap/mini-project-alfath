import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';
import 'package:mini_project_alfath/presentation/work/bloc/work_detail/work_detail_bloc.dart';
import 'package:mini_project_alfath/presentation/work/widget/shimmer/work_detail_shimmer.dart';

class DetailWorkPage extends StatefulWidget {
  final String jobKey;

  const DetailWorkPage({super.key, required this.jobKey});

  @override
  State<DetailWorkPage> createState() => _DetailWorkPageState();
}

class _DetailWorkPageState extends State<DetailWorkPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WorkDetailBloc>().add(
      WorkDetailEvent.fetchDetail(widget.jobKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Lowongan',
          style: ThemeConfig.titleMedium.copyWith(fontSize: AppSizes.s18),
        ),
        backgroundColor: AppColors.colorGeneralWhite,
      ),
      bottomNavigationBar: BlocBuilder<WorkDetailBloc, WorkDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (_) => Padding(
              padding: EdgeInsets.only(
                left: AppSizes.s16,
                right: AppSizes.s16,
                top: AppSizes.s16,
                bottom: AppSizes.s30,
              ),
              child: Button.filled(
                width: 343,
                height: 45,
                onPressed: () {
                  // Aksi apply
                },
                label: 'Apply Sekarang',
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
      body: BlocBuilder<WorkDetailBloc, WorkDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => WorkDetailShimmer(),
            loaded: (detail) => Padding(
              padding: EdgeInsets.all(AppSizes.s16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.s8),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.companyLogo.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      AppSizes.s8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail.data.pekerjaan.nama,
                            style: ThemeConfig.bodyMedium.copyWith(
                              fontSize: AppSizes.s16,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          AppSizes.s2.height,
                          Text(
                            detail.data.perusahaan.nama,
                            style: ThemeConfig.bodyMedium.copyWith(
                              fontSize: AppSizes.s12,
                              color: AppColors.colorGeneralGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSizes.s5.height,
                  Divider(color: AppColors.colorGeneralOutline, thickness: 1),
                  AppSizes.s5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Diposting',
                            style: ThemeConfig.bodyMedium.copyWith(
                              fontSize: AppSizes.s12,
                              color: AppColors.colorGeneralGrey,
                            ),
                          ),
                          AppSizes.s3.width,
                          Text(
                            detail.data.pekerjaan.createdAt,
                            style: ThemeConfig.bodyMedium.copyWith(
                              fontSize: AppSizes.s12,
                              color: AppColors.colorGeneralGrey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: AppSizes.s4,
                          right: AppSizes.s4,
                          top: AppSizes.s2,
                          bottom: AppSizes.s2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.colorSuccessBgWeak,
                          borderRadius: BorderRadius.circular(AppSizes.s4),
                        ),
                        child: Text(
                          detail.data.pekerjaan.status == "Active" ? 'Open' : 'Close',
                          style: ThemeConfig.bodyMedium.copyWith(
                            fontSize: AppSizes.s12,
                            color: AppColors.colorSuccess,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSizes.s12.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.data.pekerjaan.deskripsi,
                        style: ThemeConfig.bodyMedium.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 5), // jarak antar paragraf
                      Text(
                        detail.data.perusahaan.deskripsi,
                        style: ThemeConfig.bodyMedium.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            error: (message) => Center(
              child: ErrorPage(
                message: 'Terdapat kesalahan pada server. Silakan muat ulang!',
                image: Assets.images.error504.path,
                onPressed: () {
                  if (context.mounted) {
                    context.read<WorkDetailBloc>().add(
                      WorkDetailEvent.fetchDetail(widget.jobKey),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
