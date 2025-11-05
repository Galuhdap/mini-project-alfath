import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/component/input_component.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class RegisteredWidget extends StatefulWidget {
  const RegisteredWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onRegisterPressed,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onRegisterPressed;

  @override
  State<RegisteredWidget> createState() => _RegisteredWidgetState();
}

class _RegisteredWidgetState extends State<RegisteredWidget> {
  bool doPasswordsMatch = true;
  bool isRegisterValid = false;

  // ✅ Password rule states
  bool hasMin8Chars = false;
  bool hasUppercase = false;
  bool hasSpecialChar = false;

  void _validateFields() {
    final name = widget.nameController.text.trim();
    final phone = widget.phoneController.text.trim();
    final pass = widget.passwordController.text.trim();
    final confirm = widget.confirmPasswordController.text.trim();

    // 🔍 Password rule checks
    hasMin8Chars = pass.length >= 8;
    hasUppercase = RegExp(r'[A-Z]').hasMatch(pass);
    hasSpecialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-=]').hasMatch(pass);

    doPasswordsMatch = pass == confirm;

    // Semua syarat wajib untuk enable tombol
    isRegisterValid =
        name.isNotEmpty &&
        phone.isNotEmpty &&
        pass.isNotEmpty &&
        confirm.isNotEmpty &&
        hasMin8Chars &&
        hasUppercase &&
        hasSpecialChar &&
        doPasswordsMatch;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.nameController.addListener(_validateFields);
    widget.phoneController.addListener(_validateFields);
    widget.passwordController.addListener(_validateFields);
    widget.confirmPasswordController.addListener(_validateFields);
  }

  @override
  void dispose() {
    widget.nameController.removeListener(_validateFields);
    widget.phoneController.removeListener(_validateFields);
    widget.passwordController.removeListener(_validateFields);
    widget.confirmPasswordController.removeListener(_validateFields);
    super.dispose();
  }

  Color _ruleColor(bool condition) =>
      condition ? AppColors.colorSuccesDefault : AppColors.colorGeneralGrey;

  Widget _buildPasswordRule(String text, bool condition) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.circle_outlined,
          size: 14,
          color: _ruleColor(condition),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: ThemeConfig.bodyMedium.copyWith(
            color: _ruleColor(condition),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizes.s12.height,
        Text(
          'Nama Lengkap',
          style: ThemeConfig.bodyMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.colorGeneralBody,
            fontSize: 14,
          ),
        ),
        AppSizes.s8.height,
        CustomTextField(
          controller: widget.nameController,
          hintText: 'Masukkan Nama',
          keyboardType: TextInputType.name,
        ),
        AppSizes.s12.height,
        Text(
          'Nomor HP',
          style: ThemeConfig.bodyMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.colorGeneralBody,
            fontSize: 14,
          ),
        ),
        AppSizes.s8.height,
        CustomTextField(
          controller: widget.phoneController,
          hintText: '81234567890',
          keyboardType: TextInputType.phone,
        ),
        AppSizes.s12.height,
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
          controller: widget.passwordController,
          hintText: 'Masukkan Password',
          isObscure: true,
          suffixIcon: true,
          keyboardType: TextInputType.text,
        ),

        // 🔹 Password rules visual
        AppSizes.s8.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPasswordRule('Minimal 8 karakter', hasMin8Chars),
            _buildPasswordRule('Mengandung huruf besar', hasUppercase),
            _buildPasswordRule('Mengandung karakter spesial (@!#\$%^&*)', hasSpecialChar),
          ],
        ),

        AppSizes.s12.height,
        Text(
          'Konfirmasi Password',
          style: ThemeConfig.bodyMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.colorGeneralBody,
            fontSize: 14,
          ),
        ),
        AppSizes.s8.height,
        CustomTextField(
          controller: widget.confirmPasswordController,
          hintText: 'Masukkan Password',
          isObscure: true,
          suffixIcon: true,
          keyboardType: TextInputType.text,
        ),

        // 🔴 Error jika tidak cocok
        if (!doPasswordsMatch &&
            widget.confirmPasswordController.text.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Password dan konfirmasi password tidak cocok',
              style: ThemeConfig.bodyMedium.copyWith(
                color: AppColors.colorDangerDefault,
                fontSize: 12,
              ),
            ),
          ),

        AppSizes.s24.height,

        // 🔹 Tombol Daftar
        Button.filled(
          onPressed: isRegisterValid ? widget.onRegisterPressed : () {},
          label: 'Daftar',
          color: isRegisterValid
              ? AppColors.colorPrimary
              : AppColors.colorGeneralGrey.withOpacity(0.3),
          textColor: isRegisterValid
              ? Colors.white
              : AppColors.colorGeneralGrey,
        ),
      ],
    );
  }
}
