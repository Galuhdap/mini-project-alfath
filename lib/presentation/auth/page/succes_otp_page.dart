import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';

class SuccesOtpPage extends StatelessWidget {
  const SuccesOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDefault,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.icons.reload.path, width: 100, height: 100),
            20.height,
            Text(
              'Successfully Verified Account',
              style: ThemeConfig.titleLarge.copyWith(
                color: AppColors.colorGeneralWhite,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
            20.height,
            Button.outlined(
              onPressed: () {
                // TODO: arahkan ke halaman berikutnya, misal ke Home
                Navigator.pushReplacementNamed(context, '/work');
              },
              label: 'Halaman Selanjutnya',
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
