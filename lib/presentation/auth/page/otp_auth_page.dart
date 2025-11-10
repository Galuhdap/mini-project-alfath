import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
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
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
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
                  Text(
                    'Kirim Ulang',
                    style: ThemeConfig.titleSmall.copyWith(
                      color: AppColors.colorDefault,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.colorDefault,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
