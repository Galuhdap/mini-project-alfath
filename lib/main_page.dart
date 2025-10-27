import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => BarberShopBloc(BarberShopRemoteDatasource()),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyApp(),
        routes: {
          // '/login': (context) => const LoginPage(),
          // '/register': (context) => const RegisterPage(),
          // '/home': (context) => const HomePage(),
          // '/booking': (context) => const BookingPage(),
          // '/profile': (context) => const ProfilePage(),
        },
      ),
    );
  }
}
