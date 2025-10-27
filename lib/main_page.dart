import 'package:flutter/material.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: ErrorPage(),
        routes: {
          // '/login': (context) => const LoginPage(),
          // '/register': (context) => const RegisterPage(),
          // '/home': (context) => const HomePage(),
          // '/booking': (context) => const BookingPage(),
          // '/profile': (context) => const ProfilePage(),
        },
      );
    // MultiBlocProvider(
    //   providers: [
    //     // BlocProvider(
    //     //   create: (context) => BarberShopBloc(BarberShopRemoteDatasource()),
    //     // ),
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     home: MyApp(),
    //     routes: {
    //       // '/login': (context) => const LoginPage(),
    //       // '/register': (context) => const RegisterPage(),
    //       // '/home': (context) => const HomePage(),
    //       // '/booking': (context) => const BookingPage(),
    //       // '/profile': (context) => const ProfilePage(),
    //     },
    //   ),
    // );
  }
}
