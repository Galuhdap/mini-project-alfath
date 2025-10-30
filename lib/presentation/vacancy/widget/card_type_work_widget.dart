import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class CardTypeWorkWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CardTypeWorkWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: isSelected
                ? AppColors.colorPrimary
                : AppColors.colorGeneralOutline,
          ),
          borderRadius: BorderRadius.circular(AppSizes.s16),
          color: isSelected ? AppColors.colorPrimary.withOpacity(0.1) : null,
        ),
        child: Text(
          label,
          style: ThemeConfig.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected
                ? AppColors.colorPrimary
                : AppColors.colorGeneralGrey,
          ),
        ),
      ),
    );
  }
}