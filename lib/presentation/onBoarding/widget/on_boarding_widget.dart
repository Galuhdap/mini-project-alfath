import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String label;
  final String image;
  final Function() onPressedNext;
  final Function()? onPressedBack;

  const OnBoardingWidget({
    super.key,
    required this.title,
    required this.label,
    required this.image,

    required this.onPressedNext,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Tambahkan gradient di sini
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.colorDefaultStrong,
            AppColors.colorDefault,
            AppColors.colorDefault,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: AppSizes.s90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.icons.kejarKarirmu.path,
                  color: AppColors.colorGeneralWhite,
                  width: 100,
                  height: 40,
                ),

                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Image.asset(image),
                        Container(height: 310, color: Colors.transparent),
                      ],
                    ),
                    Container(
                      height: 325,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: AppSizes.s16,
                        right: AppSizes.s16,
                        top: AppSizes.s24,
                        bottom: AppSizes.s24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: AppColors.colorGeneralWhite,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              title,
                              style: ThemeConfig.titleLarge.copyWith(
                                fontSize: AppSizes.s32,
                                color: AppColors.colorDefaultStrong,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            AppSizes.s16.height,
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                label,
                                style: ThemeConfig.labelMedium.copyWith(
                                  color: AppColors.colorGeneralGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            AppSizes.s24.height,
                            Button.filled(
                              onPressed: onPressedNext,
                              label: 'Lanjut',
                              borderRadius: AppSizes.s12,
                            ),
                            AppSizes.s8.height,
                            if (onPressedBack != null)
                              Button.outlined(
                                onPressed: onPressedBack!,
                                label: 'Kembali',
                                borderRadius: AppSizes.s12,
                              )
                            else
                              const SizedBox(height: 45),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
