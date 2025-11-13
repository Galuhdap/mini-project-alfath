import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/bloc/verification_otp_email_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/page/succes_otp_page.dart';
import 'package:pinput/pinput.dart';

class OtpAuthPage extends StatefulWidget {
  const OtpAuthPage({super.key});

  @override
  State<OtpAuthPage> createState() => _OtpAuthPageState();
}

class _OtpAuthPageState extends State<OtpAuthPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.colorGeneralGrey),
      ),
    );
    return BlocListener<VerificationOtpEmailBloc, VerificationOtpEmailState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Memverifikasi kode OTP...')),
            );
          },
          success: (response) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text('Verifikasi OTP berhasil!'),
            //     backgroundColor: Colors.green,
            //   ),
            // );
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SuccesOtpPage()),
            );

            // TODO: Navigasi ke halaman berikutnya (contoh: home)
            // Navigator.pushReplacementNamed(context, '/home');
          },
          failed: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error), backgroundColor: Colors.redAccent),
            );
          },
        );
      },
      child: Scaffold(
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
                'Masukkan kode OTP',
                style: ThemeConfig.titleMedium.copyWith(
                  fontSize: AppSizes.s24,
                  color: AppColors.colorGeneralBlack,
                ),
              ),
              AppSizes.s4.height,
              Text(
                'Silahkan masukkan kode OTP yang kamu terima melalui email',
                style: ThemeConfig.titleSmall.copyWith(
                  fontSize: AppSizes.s14,
                  color: AppColors.colorGeneralGrey,
                ),
              ),
              AppSizes.s16.height,
              Center(
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  enableInteractiveSelection: true,
                  // smsRetriever: smsRetriever,
                  controller: pinController,
                  // focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kode OTP tidak boleh kosong';
                    }
                    return null;
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                    context.read<VerificationOtpEmailBloc>().add(
                      VerificationOtpEmailEvent.verificationEmailOtp(pin),
                    );
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 30,
                        height: 2,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.colorGeneralBody),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: AppColors.colorGeneralBody),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              30.height,
              Center(
                child: Column(
                  children: [
                    Text(
                      'Tidak menerima kode?',
                      style: ThemeConfig.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.colorGeneralGrey,
                      ),
                    ),
                    8.height,
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mengirim ulang kode...'),
                          ),
                        );
                      },
                      child: Text(
                        'Kirim Ulang',
                        style: ThemeConfig.titleSmall.copyWith(
                          color: AppColors.colorDefault,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.colorDefault,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
