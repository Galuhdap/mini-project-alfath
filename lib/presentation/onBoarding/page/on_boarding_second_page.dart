import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/presentation/onBoarding/page/on_boarding_third_page.dart';
import 'package:mini_project_alfath/presentation/onBoarding/widget/on_boarding_widget.dart';

class OnBoardingSecondPage extends StatelessWidget {
  const OnBoardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      title: 'Pelajari Skill yang Dibutuhkan Industri',
      label:
          'Akses berbagai materi yang relevan untuk meningkatkan keterampilan Anda sesuai kebutuhan pasar kerja.',
      image: Assets.images.onBoarding2.path,
      onPressedNext: () {
        context.push(OnBoardingThirdPage());
      },
      onPressedBack: () {
         context.pop();
      },
    );
  }
}
