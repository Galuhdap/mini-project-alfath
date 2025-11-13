import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';
import 'package:mini_project_alfath/presentation/onBoarding/widget/on_boarding_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final AuthService _authService = AuthService();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Selamat Datang di Kejarkarirmu',
      'label':
          'Kejarkarirmu adalah platform untuk mengembangkan karir melalui kursus dan informasi lowongan kerja',
      'image': Assets.images.onBoarding1.path,
    },
    {
      'title': 'Pelajari Skill yang Dibutuhkan Industri',
      'label':
          'Akses berbagai materi yang relevan untuk meningkatkan keterampilan Anda sesuai kebutuhan pasar kerja.',
      'image': Assets.images.onBoarding2.path,
    },
    {
      'title': 'Dapatkan Bimbingan Langsung',
      'label':
          'Belajar dari mentor berpengalaman yang siap membantu Anda memahami materi lebih dalam dan mudah di mengerti.',
      'image': Assets.images.onBoarding3.path,
    },
    {
      'title': 'Ayo Mulai Karir Impian Anda',
      'label':
          'Ikuti pelatihan dan dapatkan panduan untuk meraih pekerjaan atau promosi yang Anda inginkan.',
      'image': Assets.images.onBoarding4.path,
    },
  ];

  void _onNext() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _onBack() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _finishOnboarding() async {
    await _authService.setOnboardingShown();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _onboardingData.length,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        itemBuilder: (context, index) {
          final data = _onboardingData[index];
          return OnBoardingWidget(
            title: data['title']!,
            label: data['label']!,
            image: data['image']!,
            onPressedNext: _onNext,
            onPressedBack: _currentIndex == 0 ? null : _onBack,
            isLastPage: index == _onboardingData.length - 1,
          );
        },
      ),
    );
  }
}
