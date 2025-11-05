import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // final AuthService _authService = AuthService();
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    // _initializeApp();
    //_setupTimeout();
  }

  void setupTimeout() {
    // Fallback timeout to prevent infinite loading
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && !_hasNavigated) {
        print('Timeout reached, forcing navigation to login');
        _navigateToLogin();
      }
    });
  }

  void _navigateToLogin() {
    if (!_hasNavigated && mounted) {
      _hasNavigated = true;
      Navigator.pushReplacementNamed(context, '/onBoarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDefault,
      body: Center(
        child: SvgPicture.asset(
          Assets.icons.kejarKarirmu.path,
          color: Colors.white,
          width: 159,
          height: 54,
        ),
      ),
    );
  }
}
