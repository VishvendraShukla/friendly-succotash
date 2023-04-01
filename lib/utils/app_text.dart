import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const AppText({Key? key, required this.text, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
