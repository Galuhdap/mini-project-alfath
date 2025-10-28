import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/presentation/connectivity/bloc/bloc/connectivity_bloc.dart';
import 'package:mini_project_alfath/presentation/vacancy/page/detail_vacancy_page.dart';
import 'package:mini_project_alfath/presentation/vacancy/page/vacancy_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ConnectivityBloc(Connectivity())
                ..add(const ConnectivityEvent.checkConnection()),
        ),
        // BlocProvider(
        //   create: (context) => BarberShopBloc(BarberShopRemoteDatasource()),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: VacancyPage(),

        routes: {
          '/vacancy': (context) => const VacancyPage(),
          '/detail/vacancy': (context) => const DetailVacancyPage(),
        },
      ),
    );
  }
}
