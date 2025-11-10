import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/component/input_component.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class EmailLoginWidget extends StatelessWidget {
  const EmailLoginWidget({
    super.key,
    required this.passwordController,
    required this.isLoginValid,
    required this.onLoginPressed,
    this.isLoading = false,
  });

  final TextEditingController passwordController;
  final bool isLoginValid;
  final Function() onLoginPressed;
    final bool isLoading;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizes.s8.height,
        Text(
          'Akun telah ditemukan. Silakan masukkan password.',
          style: ThemeConfig.bodyMedium.copyWith(
            color: AppColors.colorSuccesDefault,
            fontSize: 12,
          ),
        ),
        AppSizes.s16.height,
        Text(
          'Password',
          style: ThemeConfig.bodyMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.colorGeneralBody,
            fontSize: 14,
          ),
        ),
        AppSizes.s8.height,
        CustomTextField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          isObscure: true,
          suffixIcon: true, // 👈 ini penting
          hintText: 'Masukkan Password',
        ),
        AppSizes.s24.height,
       isLoading? Center(child: CircularProgressIndicator(),) : Button.filled(
          onPressed: isLoginValid ? onLoginPressed : () {},
          label: 'Masuk',
          color: isLoginValid
              ? AppColors
                    .colorPrimary // aktif
              : AppColors.colorGeneralGrey.withAlpha(70), // nonaktif
        ),
      ],
    );
  }
}
