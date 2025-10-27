
import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = AppColors.colorPrimary900,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderRadius = 8.0,
    this.icon,
    this.iconRight,
    this.disabled = false,
    this.fontSize = 16.0,
    this.borderColor,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = AppColors.colorNeutrals0,
    this.textColor = AppColors.colorPrimary900,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.icon,
    this.iconRight,
    this.disabled = false,
    this.fontSize = 16.0,
    this.borderColor,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final Widget? iconRight;
  final bool disabled;
  final double fontSize;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return style == ButtonStyle.filled
        ? ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: iconRight != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox.shrink(),
                if (icon != null) const SizedBox(width: 10.0),
                Text(
                  label,
                  style: ThemeConfig.labelLarge.copyWith(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
                iconRight ?? const SizedBox.shrink(),
                if (iconRight != null) const SizedBox(width: 10.0),
              ],
            ),
          )
        : OutlinedButton(
            onPressed: disabled ? null : onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: color,
              side: BorderSide(color: borderColor ?? AppColors.colorPrimary900),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: iconRight != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox.shrink(),
                if (icon != null) const SizedBox(width: 10.0),
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                iconRight ?? const SizedBox.shrink(),
                if (iconRight != null) const SizedBox(width: 10.0),
              ],
            ),
          );
  }
}
