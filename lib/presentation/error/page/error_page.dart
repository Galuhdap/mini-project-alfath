import 'package:flutter/material.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/error/widget/button_reload_widget.dart';
import 'package:mini_project_alfath/presentation/error/widget/error_header_widget.dart';

class ErrorPage extends StatefulWidget {
  final bool isNoConnection;
  final Function()? onPressed;
  final String? message;
  final String? image;
  const ErrorPage({
    super.key,
    this.isNoConnection = true,
    required this.message,
    required this.image,
    this.onPressed,
  });

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
              message: widget.message ?? '',
              image: widget.image ?? '',
            ),
            AppSizes.s16.height,
            widget.isNoConnection
                ? ButtonReload(onPressed: widget.onPressed ?? () {})
                : Container(),
          ],
        ),
      ),
    );
  }
}
