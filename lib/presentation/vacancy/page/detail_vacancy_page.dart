import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class DetailVacancyPage extends StatelessWidget {
  const DetailVacancyPage({super.key});

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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.s16),
        child: Button.filled(
          width: 343,
          height: 45,
          onPressed: () {},
          label: 'Apply Sekarang',
        ),
      ),
      body: Padding(
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
                      'UI/UX Designer',
                      style: ThemeConfig.bodyMedium.copyWith(
                        fontSize: AppSizes.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSizes.s2.height,
                    Text(
                      'Nama Company',
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
                      '17/08/2024',
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
                    'Open',
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
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                  style: ThemeConfig.bodyMedium.copyWith(fontSize: 14),
                ),
                SizedBox(height: 5), // jarak antar paragraf
                Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                  style: ThemeConfig.bodyMedium.copyWith(fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                  style: ThemeConfig.bodyMedium.copyWith(fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                  style: ThemeConfig.bodyMedium.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
