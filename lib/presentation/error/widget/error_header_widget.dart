import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class ErrorHeaderWidget extends StatelessWidget {
  final String message;
  final String image;
  const ErrorHeaderWidget({
    super.key,
    required this.message,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 200, height: 200),
        AppSizes.s16.height,
        SizedBox(
          width: 250,
          height: 50,
          child: Text(
            message,
            style: ThemeConfig.bodyMedium.copyWith(
              color: AppColors.colorGeneralTittleError,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
