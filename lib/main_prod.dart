import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/data/service/lib/network_constans.dart';
import 'package:mini_project_alfath/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  FlavorConfig(
    flavor: Flavor.production,
    baseUrl: NetworkConstants.BASE_URL_PROD,
  );
  runApp(MainPage());
}
