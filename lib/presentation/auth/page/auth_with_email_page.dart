import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/component/input_component.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/auth/widget/email_login_widget.dart';
import 'package:mini_project_alfath/presentation/auth/widget/registered_widget.dart';

class AuthWithEmailPage extends StatefulWidget {
  const AuthWithEmailPage({super.key});

  @override
  State<AuthWithEmailPage> createState() => _AuthWithEmailPageState();
}

class _AuthWithEmailPageState extends State<AuthWithEmailPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool? isEmailRegistered;

  bool get isEmailValid => emailController.text.trim().isNotEmpty;
  bool get isLoginValid => passwordController.text.trim().isNotEmpty;
  bool get doPasswordsMatch =>
      passwordController.text.trim() == confirmPasswordController.text.trim();

  bool get isRegisterValid =>
      nameController.text.trim().isNotEmpty &&
      phoneController.text.trim().isNotEmpty &&
      passwordController.text.trim().isNotEmpty &&
      confirmPasswordController.text.trim().isNotEmpty &&
      doPasswordsMatch; // ✅ hanya true kalau password cocok

  void checkEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) return;

    setState(() {
      if (email.contains("test")) {
        isEmailRegistered = true;
      } else {
        isEmailRegistered = false;
      }
    });
  }

  void _refreshState() => setState(() {});

  @override
  void initState() {
    super.initState();

    // setiap kali user mengetik, cek lagi validasi
    emailController.addListener(_refreshState);
    passwordController.addListener(_refreshState);
    confirmPasswordController.addListener(_refreshState);
    nameController.addListener(_refreshState);
    phoneController.addListener(_refreshState);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk atau Daftar',
              style: ThemeConfig.titleMedium.copyWith(
                fontSize: AppSizes.s24,
                color: AppColors.colorGeneralBlack,
              ),
            ),
            AppSizes.s4.height,
            Text(
              'Silakan masukkan emailmu untuk melanjutkan',
              style: ThemeConfig.titleSmall.copyWith(
                fontSize: AppSizes.s14,
                color: AppColors.colorGeneralGrey,
              ),
            ),
            AppSizes.s16.height,
            Text(
              'Email',
              style: ThemeConfig.bodyMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.colorGeneralBody,
                fontSize: 14,
              ),
            ),
            AppSizes.s8.height,
            CustomTextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Masukkan Email',
            ),
            if (isEmailRegistered == true) ...[
              EmailLoginWidget(
                passwordController: passwordController,
                onLoginPressed: () {},
                isLoginValid: isLoginValid,
              ),
            ] else if (isEmailRegistered == false) ...[
              RegisteredWidget(
                nameController: nameController,
                phoneController: phoneController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                onRegisterPressed: () {
                  print("✅ Daftar berhasil");
                },
              ),
            ]
            // 🔹 Default state (belum dicek)
            else ...[
              AppSizes.s16.height,
              Button.filled(onPressed: checkEmail, label: 'Lanjut'),
            ],
          ],
        ),
      ),
    );
  }
}
