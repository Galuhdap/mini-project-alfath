import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/data/service/job_seeker_service.dart';
import 'package:mini_project_alfath/presentation/connectivity/bloc/connectivity/connectivity_bloc.dart';
import 'package:mini_project_alfath/presentation/work/bloc/work_detail/work_detail_bloc.dart';
import 'package:mini_project_alfath/presentation/work/bloc/work/work_bloc.dart';
import 'package:mini_project_alfath/presentation/work/page/work_page.dart';

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
        BlocProvider(create: (context) => WorkBloc(JobSeekerService())),
        BlocProvider(create: (context) => WorkDetailBloc(JobSeekerService())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: WorkPage(),

        routes: {'/work': (context) => const WorkPage()},
      ),
    );
  }
}
