import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, tertiary }

enum ButtonState { enabled, disabled }

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.state = ButtonState.enabled,
    this.label = 'Button',
  });

  final VoidCallback onPressed;
  final ButtonType type;
  final ButtonState state;
  final String label;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    TextStyle textStyle;
    ButtonStyle buttonStyle;

    switch (type) {
      case ButtonType.tertiary:
        backgroundColor = AppColors.mainBackground;
        textStyle = AppTypography.bodyMedium.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        );
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0, // Remove shadow
        );
        break;
      case ButtonType.primary:
      default:
        backgroundColor = state == ButtonState.enabled
            ? AppColors.primaryColor
            : AppColors.ambientColor;
        textStyle = AppTypography.bodyMedium.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
        break;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: state == ButtonState.enabled ? onPressed : null,
        child: Text(
          label,
          style: textStyle,
        ),
      ),
    );
  }
}
