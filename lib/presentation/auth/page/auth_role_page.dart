import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/datasource/auth/auth_local_datasource.dart';
import 'package:mini_project_alfath/presentation/auth/page/login_page.dart';

class AuthRolePage extends StatelessWidget {
  const AuthRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDefault, // warna latar belakang biru
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.colorGeneralBlack.withAlpha(200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Opacity(
                      opacity: 0.25,
                      child: Image.asset(Assets.images.bgLogin.path),
                    ),
                    Container(height: 310, color: AppColors.colorGeneralWhite),
                  ],
                ),
                Container(
                  //  height: 325,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: AppSizes.s16,
                    right: AppSizes.s16,
                    top: AppSizes.s24,
                    bottom: AppSizes.s24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: AppColors.colorGeneralWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: ThemeConfig.titleLarge.copyWith(
                          fontSize: AppSizes.s24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppSizes.s4.height,
                      Text(
                        'Silakan pilih jenis akun untuk melanjutkan',
                        style: ThemeConfig.labelMedium.copyWith(
                          color: AppColors.colorGeneralGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AppSizes.s24.height,
                      Button.outlined(
                        onPressed: () async {
                          await AuthLocalHiveDatasource().saveRole('jobseeker');
                          context.pushReplacement(LoginPage());
                        },
                        label: 'Login Sebagai Pengguna',
                        fontSize: 14,
                        borderColor: AppColors.colorGeneralOutline,
                        textColor: AppColors.colorGeneralDefaultBlack,
                        icon: SvgPicture.asset(Assets.icons.user.path),
                      ),
                      AppSizes.s16.height,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.colorGeneralPlaceHolder,
                            ),
                          ),
                          16.width,
                          Text(
                            'atau',
                            style: ThemeConfig.bodyMedium.copyWith(
                              fontSize: AppSizes.s10,
                              color: AppColors.colorGeneralPlaceHolder,
                            ),
                          ),
                          16.width,
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.colorGeneralPlaceHolder,
                            ),
                          ),
                        ],
                      ),
                      AppSizes.s16.height,
                      Button.outlined(
                        onPressed: () async {
                          await AuthLocalHiveDatasource().saveRole('company');
                          context.pushReplacement(LoginPage());
                        },
                        label: 'Login Sebagai Perusahaan',
                        fontSize: 14,
                        borderColor: AppColors.colorGeneralOutline,
                        textColor: AppColors.colorGeneralDefaultBlack,
                        icon: SvgPicture.asset(Assets.icons.perusahaan.path),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'Dengan mendaftar, Saya menyetujui ',
                            style: ThemeConfig.bodyMedium.copyWith(
                              fontSize: AppSizes.s12,
                              color: AppColors.colorGeneralBody,
                            ),
                            children: [
                              TextSpan(
                                text: '\nSyarat dan Ketentuan ',
                                style: ThemeConfig.bodyMedium.copyWith(
                                  fontSize: AppSizes.s12,
                                  color: AppColors.colorPrimary,
                                ),
                              ),
                              TextSpan(
                                text: 'yang berlaku dan ',
                                style: ThemeConfig.bodyMedium.copyWith(
                                  fontSize: AppSizes.s12,
                                  color: AppColors.colorGeneralBody,
                                ),
                              ),
                              TextSpan(
                                text: 'Kebijakan Privasi',
                                style: ThemeConfig.bodyMedium.copyWith(
                                  fontSize: AppSizes.s12,
                                  color: AppColors.colorPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      64.height,
                    ],
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
