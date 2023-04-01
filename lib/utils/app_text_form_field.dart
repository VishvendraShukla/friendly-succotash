import 'package:flutter/material.dart';
import 'package:planner/utils/app_globals.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onSuffixIconTap;
  final TextEditingController textEditingController;
  final String? Function(String?)? validatorFunction;
  final TextInputType keyboardType;
  final bool? obscureText;

  const AppTextFormField(
      {Key? key,
      required this.labelText,
      this.prefixIcon,
      this.onSuffixIconTap,
      this.suffixIcon,
      this.validatorFunction,
      required this.keyboardType,
      this.obscureText,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return suffixIcon == null
        ? buildWithOutSuffixIcon()
        : buildWithSuffixIcon();
  }

  Widget buildWithSuffixIcon() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: textEditingController,
        validator: validatorFunction,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: appTextStyle50,
          floatingLabelStyle: appTextStyle50,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: GestureDetector(
            onTap: onSuffixIconTap,
            child: Padding(
              padding: const EdgeInsets.all(18), // add padding to adjust icon
              child: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWithOutSuffixIcon() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: textEditingController,
        validator: validatorFunction,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: appTextStyle50,
          floatingLabelStyle: appTextStyle50,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
