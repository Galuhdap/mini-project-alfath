import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/data/service/job_seeker_service.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/bloc/verification_otp_email_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/otp/otp_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/register/register_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/checkEmail/check_email_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/bloc/login/login_bloc.dart';
import 'package:mini_project_alfath/presentation/auth/page/auth_role_page.dart';
import 'package:mini_project_alfath/presentation/auth/page/auth_with_email_page.dart';
import 'package:mini_project_alfath/presentation/auth/page/login_page.dart';
import 'package:mini_project_alfath/presentation/auth/page/otp_auth_page.dart';
import 'package:mini_project_alfath/presentation/auth/page/splash_page.dart';
import 'package:mini_project_alfath/presentation/auth/page/succes_otp_page.dart';
import 'package:mini_project_alfath/presentation/connectivity/bloc/connectivity/connectivity_bloc.dart';
import 'package:mini_project_alfath/presentation/onBoarding/page/on_boarding_page.dart';
import 'package:mini_project_alfath/presentation/work/bloc/bloc/working_bloc.dart';
import 'package:mini_project_alfath/presentation/work/bloc/work_detail/work_detail_bloc.dart';
import 'package:mini_project_alfath/presentation/work/page/work_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<VerificationOtpEmailBloc>(create: (context) => VerificationOtpEmailBloc()),
        BlocProvider<OtpBloc>(create: (context) => OtpBloc()),
        BlocProvider<CheckEmailBloc>(create: (context) => CheckEmailBloc()),
        BlocProvider(
          create: (_) =>
              ConnectivityBloc(Connectivity())
                ..add(const ConnectivityEvent.checkConnection()),
        ),
        BlocProvider(create: (context) => WorkingBloc(JobSeekerService())),
        BlocProvider(create: (context) => WorkDetailBloc(JobSeekerService())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: SplashPage(),

        routes: {
          '/work': (context) => const WorkPage(),
          '/login': (context) => const LoginPage(),
          '/onBoarding': (context) => const OnBoardingPage(),
          '/auth/role': (context) => const AuthRolePage(),
          '/otp': (context) => const OtpAuthPage(),
        },
      ),
    );
  }
}
