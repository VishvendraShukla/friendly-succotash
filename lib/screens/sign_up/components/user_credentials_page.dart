import 'package:flutter/material.dart';
import 'package:planner/providers/sign_up_provider.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/app_text_form_field.dart';
import 'package:planner/utils/app_text_validator.dart';
import 'package:provider/provider.dart';

class UserCredentialsPage extends StatefulWidget {
  final VoidCallback? onPressed;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const UserCredentialsPage(
      {Key? key,
      this.onPressed,
      required this.usernameController,
      required this.passwordController})
      : super(key: key);

  @override
  UserCredentialsPageState createState() => UserCredentialsPageState();
}

class UserCredentialsPageState extends State<UserCredentialsPage> {

  @override
  Widget build(BuildContext context) {
    bool isObscured = context.watch<SignUpProvider>().obscured;
    String oldValue = Provider.of<SignUpProvider>(context, listen: true).value;
    Future.delayed(Duration.zero, () async {
      if(widget.passwordController.text.isEmpty) {
        widget.passwordController.text = oldValue;
      }
    });
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Username',
                keyboardType: TextInputType.text,
                validatorFunction: UsernameValidator.validate,
                obscureText: false,
                textEditingController: widget.usernameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Password',
                keyboardType: TextInputType.text,
                validatorFunction: PasswordValidator.validate,
                obscureText: isObscured,
                textEditingController: widget.passwordController,
                suffixIcon: isObscured
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onSuffixIconTap: () => {
                  context
                      .read<SignUpProvider>()
                      .saveValue(widget.passwordController.value.text),
                  context.read<SignUpProvider>().toggleObscured()
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                heroTag: "nextFromCredentials",
                backgroundColor: AppColors.appButtonDarkColor,
                onPressed: widget.onPressed,
                icon: const Icon(Icons.arrow_forward),
                label: AppText(
                  text: 'Next',
                  textStyle: appButtonTextStyle300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
