import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/data/service/lib/network_constans.dart';
import 'package:mini_project_alfath/main_page.dart';


void main() {
  FlavorConfig(
    flavor: Flavor.production,
    baseUrl: NetworkConstants.BASE_URL_PROD,
  );
  runApp(MainPage());
}
