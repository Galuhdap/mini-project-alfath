import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/presentation/onBoarding/page/on_boarding_fourth_page.dart';
import 'package:mini_project_alfath/presentation/onBoarding/widget/on_boarding_widget.dart';

class OnBoardingThirdPage extends StatelessWidget {
  const OnBoardingThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      title: 'Dapatkan Bimbingan Langsung',
      label:
          'Belajar dari mentor berpengalaman yang siap membantu Anda memahami materi lebih dalam dan mudah di mengerti.',
      image: Assets.images.onBoarding3.path,
      onPressedNext: () {
        context.push(OnBoardingFourthPage());
      },
      onPressedBack: () {
         context.pop();
      },
    );
  }
}
