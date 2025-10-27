import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/error/widget/button_reload_widget.dart';
import 'package:mini_project_alfath/presentation/error/widget/error_header_widget.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ErrorHeaderWidget(
              message: 'Tidak terhubung ke internet.',
              image:  Assets.images.noConnection.path,
            ),
            AppSizes.s16.height,
            ButtonReload(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
