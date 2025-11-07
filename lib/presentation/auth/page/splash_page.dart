import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/bloc/login_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthService _authService = AuthService();
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
    _setupTimeout();
  }

  /// ⏳ Timeout agar tidak stuck di splash terlalu lama
  void _setupTimeout() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && !_hasNavigated) {
        debugPrint('⏰ Timeout reached — fallback ke LoginPage');
        _navigateToLogin();
      }
    });
  }

  /// 🚀 Inisialisasi awal aplikasi
  Future<void> _initializeApp() async {
    try {
      debugPrint('🚀 Initializing app...');

      // Simulasi durasi minimal splash
      await Future.delayed(const Duration(seconds: 2));

      // Cek apakah onboarding sudah pernah ditampilkan
      final isOnboardingShown = await _authService.isOnboardingShown();
      debugPrint('📊 Onboarding shown: $isOnboardingShown');

      if (!isOnboardingShown) {
        debugPrint(
          '🧭 Onboarding belum pernah ditampilkan → Navigasi ke Onboarding',
        );
        _navigateToOnboarding();
        return;
      }

      // Jika sudah pernah, coba auto-login
      debugPrint('🔐 Onboarding sudah tampil, mencoba auto-login...');
      if (mounted) {
        context.read<LoginBloc>().add(const LoginEvent.autoLoginRequested());
      }
    } catch (e, s) {
      debugPrint('❌ Error in _initializeApp: $e\n$s');
      _navigateToLogin();
    }
  }

  /// 🧭 Navigasi ke LoginPage
  void _navigateToLogin() {
    if (!_hasNavigated && mounted) {
      _hasNavigated = true;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  

  /// 🧭 Navigasi ke OnboardingPage
  void _navigateToOnboarding() {
    if (!_hasNavigated && mounted) {
      _hasNavigated = true;
      Navigator.pushReplacementNamed(context, '/onBoarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (_hasNavigated) return; // cegah navigasi ganda

        state.maybeWhen(
          success: (user) {
            debugPrint('✅ Auto-login berhasil — navigasi ke Home');
            _hasNavigated = true;
            Navigator.pushReplacementNamed(context, '/work');
          },
          failed: (error) {
            debugPrint('⚠️ Auto-login gagal: $error');
            _navigateToLogin();
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.colorDefault,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.kejarKarirmu.path,
                color: Colors.white,
                width: 160,
                height: 54,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
