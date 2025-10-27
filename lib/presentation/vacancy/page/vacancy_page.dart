import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/presentation/connectivity/bloc/bloc/connectivity_bloc.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';

class VacancyPage extends StatelessWidget {
  const VacancyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            connected: () {
              return const ConnectedView();
            },
            disconnected: () {
              return const ErrorPage();
            } ,
          );
        },
      ),
    );
  }
}

class ConnectedView extends StatelessWidget {
  const ConnectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ini ada internet 🌐',
        style: TextStyle(fontSize: 22, color: Colors.green),
      ),
    );
  }
}