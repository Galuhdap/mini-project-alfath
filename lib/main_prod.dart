import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/main_page.dart';


void main() {
  FlavorConfig(
    flavor: Flavor.production,
    baseUrl: 'https://api.barberhub.com',
  );
  runApp(MainPage());
}
