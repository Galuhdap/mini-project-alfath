import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/data/service/lib/network_constans.dart';
import 'package:mini_project_alfath/main_page.dart';


void main() async {

  FlavorConfig(
    flavor: Flavor.development,
    baseUrl: NetworkConstants.BASE_URL_DEV,
  );
  runApp(const MainPage());
}