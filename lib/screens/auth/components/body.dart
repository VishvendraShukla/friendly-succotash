import 'package:flutter/material.dart';
import 'package:planner/providers/auth_provider.dart';
import 'package:planner/utils/app_button.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/app_text_form_field.dart';
import 'package:planner/utils/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  FormStateBody createState() => FormStateBody();
}

class FormStateBody extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isObscured = context.watch<AuthProvider>().obscured;
    String oldValue = Provider.of<AuthProvider>(context, listen: true).value;
    String snackbarMessage = Provider.of<AuthProvider>(context, listen: true).snackbarMessage;
    bool showToast = Provider.of<AuthProvider>(context, listen: true).showSnackbar;
    bool toggleState = Provider.of<AuthProvider>(context, listen: true).showPassword;
    bool canLogin = Provider.of<AuthProvider>(context, listen: true).canLogin;
    Future.delayed(Duration.zero, () async {
      passwordController.text = oldValue;
      if (showToast) {
        final snackBar = SnackBar(
          content: AppText(
            text: snackbarMessage,
            textStyle: appTextStyleWhite50,
          ),
          backgroundColor: Colors.black45,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        context.read<AuthProvider>().disableSnackBar();
      }
      if (canLogin) {
        Navigator.of(context).pushNamed(AppRoutes.home);
        usernameController.clear();
        passwordController.clear();
      }
    });
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 70),
          Image.asset("lib/assets/images/auth_page_filler.png",
              width: getProportionateScreenWidth(120)),
          const SizedBox(height: 20),
          AppText(
            text: 'Welcome back you\'ve been missed!',
            textStyle: appTextStyle300,
          ),
          const SizedBox(height: 20),
          Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    labelText: 'Username',
                    keyboardType: TextInputType.name,
                    validatorFunction: validateUsername,
                    textEditingController: usernameController,
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: toggleState,
                    child: AppTextFormField(
                      labelText: 'Password',
                      keyboardType: TextInputType.name,
                      validatorFunction: validatePassword,
                      obscureText: isObscured,
                      textEditingController: passwordController,
                      suffixIcon: isObscured ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      onSuffixIconTap: () => {
                        context
                            .read<AuthProvider>()
                            .saveValue(passwordController.value.text),
                        context.read<AuthProvider>().toggleObscured()
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 25, top: 14, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        // AppText(
                        //   text: 'Forgot Password?',
                        //   textStyle: appTextStyle100,
                        // )
                      ],
                    ),
                  ),
                  AppButton(
                    buttonTextStyle: appButtonTextStyle300,
                    text: toggleState ? 'Log In' : 'Verify',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey.currentState!.validate()) {
                        if (!toggleState &&
                            usernameController.value.text.isNotEmpty) {
                          context
                              .read<AuthProvider>()
                              .verifyUsername(usernameController.value.text);
                        } else if (toggleState &&
                            passwordController.value.text.isNotEmpty) {
                          context.read<AuthProvider>().verifyUserAndLogin(
                              usernameController.value.text,
                              passwordController.value.text);
                        }
                      }
                    },
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'Not a member?',
                  textStyle: appTextStyle300,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                    child: AppText(
                      text: 'Sign Up',
                      textStyle: appTextStyle300Hyperlink,
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.signUpPage))
              ],
            ),
          )
        ],
      ),
    );
  }

  String? validateUsername(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please Enter Username';
    }
    if (!alphabetRegex.hasMatch(fieldContent)) {
      return 'Invalid Username';
    }
    return null;
  }

  String? validatePassword(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please Enter Password';
    }
    if (!alphabetRegex.hasMatch(fieldContent)) {
      return 'Invalid Password';
    }
    return null;
  }
}
