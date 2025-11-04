import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';

class SearchJobVacancyWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;
  final Function(String)? onChanged;

  const SearchJobVacancyWidget({
    super.key,
    required this.controller,
    required this.onTap,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 44,
            child: TextField(
              
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.colorGeneralWhite,
                hintText: 'Cari Lowongan',
                hintStyle: ThemeConfig.bodyMedium.copyWith(
                  color: AppColors.colorGeneralPlaceHolder,
                  fontSize: 14,
                ),
                border: const OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.colorGeneralPlaceHolder,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.s10),
                  borderSide: BorderSide(
                    color: AppColors.colorExtraColor300,
                    width: AppSizes.s2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.colorGeneralOutline,
                    width: AppSizes.s1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s10),
                ),
                contentPadding: AppSizes.symmetricPadding(
                  horizontal: AppSizes.s16,
                  vertical: AppSizes.s17,
                ),
              ),
            ),
          ),
        ),
        AppSizes.s12.width,
        InkWell(
          onTap: onTap,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.colorGeneralWhite,
              borderRadius: BorderRadius.circular(AppSizes.s8),
              border: Border.all(
                color: AppColors.colorGeneralOutline,
                width: AppSizes.s1,
              ),
            ),
            child: Center(child: SvgPicture.asset(Assets.icons.filter.path)),
          ),
        ),
      ],
    );
  }
}