import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/presentation/onBoarding/page/on_boarding_second_page.dart';
import 'package:mini_project_alfath/presentation/onBoarding/widget/on_boarding_widget.dart';

class OnBoardingFirstPage extends StatelessWidget {
  const OnBoardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      title: 'Selamat Datang di Kejarkarirmu',
      label:
          'Kejarkarirmu adalah platform untuk mengembangkan karir melalui kursus dan informasi lowongan kerja',
      image: Assets.images.onBoarding1.path,
      onPressedNext: () {
        context.push(OnBoardingSecondPage());
      },
      // onPressedBack: () {},
    );
  }
}
