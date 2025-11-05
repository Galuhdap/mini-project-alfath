import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/presentation/onBoarding/widget/on_boarding_widget.dart';

class OnBoardingFourthPage extends StatelessWidget {
  const OnBoardingFourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      title: 'Ayo Mulai Karir Impian Anda',
      label:
          'Ikuti pelatihan dan dapatkan panduan untuk meraih pekerjaan atau promosi yang Anda inginkan.',
      image: Assets.images.onBoarding4.path,
      onPressedNext: () {},
      onPressedBack: () {
         context.pop();
      },
    );
  }
}
