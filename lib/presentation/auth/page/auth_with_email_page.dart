import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/component/dialog/show_bottom_dialog.dart';
import 'package:mini_project_alfath/core/component/input_component.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/data/model/request/register_request.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/otp/otp_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/register/register_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/checkEmail/check_email_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/login/login_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/page/otp_auth_page.dart';
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

    context.read<CheckEmailBloc>().add(
      CheckEmailEvent.checkEmailRequested(email: email),
    );

    // setState(() {
    //   if (email.contains("aansatrianto@gmail.com")) {
    //     isEmailRegistered = true;
    //   } else {
    //     isEmailRegistered = false;
    //   }
    // });
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
    return BlocConsumer<CheckEmailBloc, CheckEmailState>(
      listener: (context, state) {
        state.maybeWhen(
          failed: (error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error)));
          },
          success: (response) {
            // misalnya API mengembalikan informasi apakah email sudah terdaftar
            setState(() {
              isEmailRegistered = response.data.isRegistered;
            });
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

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
                if (isLoading)
                  Column(
                    children: [
                      10.height,
                      const Center(child: LinearProgressIndicator()),
                    ],
                  )
                else if (isEmailRegistered == true) ...[
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (user) {
                          Navigator.pushReplacementNamed(context, '/work');
                        },
                        failed: (error) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(error)));
                        },
                        orElse: () {},
                      );
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );

                        return EmailLoginWidget(
                          passwordController: passwordController,
                          onLoginPressed: () {
                            context.read<LoginBloc>().add(
                              LoginEvent.loginRequested(
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              ),
                            );
                          },
                          isLoginValid: isLoginValid,
                          isLoading: isLoading,
                        );
                      },
                    ),
                  ),
                ] else if (isEmailRegistered == false) ...[
                  BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (user) {
                          showModalBottom(
                            context,
                            BlocListener<OtpBloc, OtpState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  loading: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Mengirim kode OTP...'),
                                      ),
                                    );
                                  },
                                  success: (_) {
                                    Navigator.pop(context); // tutup modal
                                    context.pushReplacement(
                                      const OtpAuthPage(),
                                    );
                                  },
                                  failed: (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(error)),
                                    );
                                  },
                                  orElse: () {},
                                );
                              },
                              child: BlocConsumer<OtpBloc, OtpState>(
                                listener: (context, state) {
                                  state.maybeWhen(
                                    success: (_) {
                                      //Navigator.pop(context); // tutup modal
                                      context.pushReplacement(
                                        const OtpAuthPage(),
                                      );
                                    },
                                    failed: (error) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(error)),
                                      );
                                    },
                                    orElse: () {},
                                  );
                                },
                                builder: (context, state) {
                                  final isLoading = state.maybeWhen(
                                    loading: () => true,
                                    orElse: () => false,
                                  );
                                  return SafeArea(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.s24,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppSizes.s24.height,
                                          Text(
                                            'Kirim kode OTP',
                                            style: ThemeConfig.bodyMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          AppSizes.s8.height,
                                          Text(
                                            'Registrasi akun berhasil! Silakan pilih metode pengiriman kode OTP',
                                            style: ThemeConfig.labelSmall
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: AppSizes.s12,
                                                  color: AppColors
                                                      .colorGeneralGrey,
                                                ),
                                          ),
                                          AppSizes.s20.height,
                                          AnimatedSwitcher(
                                            duration: const Duration(
                                              milliseconds: 250,
                                            ),
                                            child: isLoading
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : Button.filled(
                                                    onPressed: () {
                                                      // ✅ Tampilkan SnackBar
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                            'Mengirim kode OTP...',
                                                          ),
                                                        ),
                                                      );

                                                      // ✅ Trigger kirim OTP via Bloc
                                                      context.read<OtpBloc>().add(
                                                        const OtpEvent.sendEmailOtp(),
                                                      );
                                                    },
                                                    label:
                                                        'Kirim OTP melalui email',
                                                  ),
                                          ),
                                          AppSizes.s24.height,
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        failed: (error) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(error)));
                        },
                        orElse: () {},
                      );
                    },
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );

                        if (isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return RegisteredWidget(
                          nameController: nameController,
                          phoneController: phoneController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          onRegisterPressed: () {
                            var data = RegisterAuthRequest(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phoneNumber: phoneController.text,
                            );
                            context.read<RegisterBloc>().add(
                              RegisterEvent.registerRequested(data),
                            );
                          },
                        );
                      },
                    ),
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
      },
    );
  }
}
