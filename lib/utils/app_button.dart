import 'package:flutter/material.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final TextStyle buttonTextStyle;
  final VoidCallback? onPressed;

  const AppButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.buttonTextStyle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.appButtonDarkColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppText(
            text: text,
            textStyle: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
