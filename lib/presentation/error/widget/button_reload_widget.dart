import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_alfath/core/assets/assets.gen.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';

class ButtonReload extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonReload({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Button.filled(
        onPressed: onPressed,
        label: 'Muat Ulang',
        icon: SvgPicture.asset(Assets.icons.reload.path),
        width: 161,
        height: 48,
        borderRadius: 12,
      ),
    );
  }
}
