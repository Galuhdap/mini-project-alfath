import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class CardWorkVacancyWidget extends StatelessWidget {
  final String title;
  final String type;
  final String companyName;
  final String location;
  final String postedDate;
  final String status;
  final Function()? onTap;

  const CardWorkVacancyWidget({
    super.key,
    required this.title,
    required this.type,
    required this.companyName,
    required this.location,
    required this.postedDate,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.colorGeneralWhite,
          borderRadius: BorderRadius.circular(AppSizes.s16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 13),
              blurRadius: 56.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.colorPrimary.withAlpha(20),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: ThemeConfig.bodyMedium.copyWith(
                    fontSize: AppSizes.s16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  type,
                  style: ThemeConfig.bodyMedium.copyWith(
                    fontSize: AppSizes.s12,
                    color: AppColors.colorPrimary,
                  ),
                ),
              ],
            ),
            AppSizes.s5.height,
            Divider(color: AppColors.colorGeneralOutline, thickness: 1),
            AppSizes.s5.height,
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
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
                      companyName,
                      style: ThemeConfig.bodyMedium.copyWith(
                        fontSize: AppSizes.s14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSizes.s2.height,
                    Text(
                      location,
                      style: ThemeConfig.bodyMedium.copyWith(
                        fontSize: AppSizes.s12,
                        color: AppColors.colorGeneralGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppSizes.s12.height,
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
                      postedDate,
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
                    status,
                    style: ThemeConfig.bodyMedium.copyWith(
                      fontSize: AppSizes.s12,
                      color: AppColors.colorSuccess,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
