import 'package:flutter/material.dart';
import 'package:planner/models/sign_up_vo.dart';
import 'package:planner/providers/sign_up_provider.dart';
import 'package:planner/screens/sign_up/components/step_progress_view.dart';
import 'package:planner/screens/sign_up/components/user_address_page.dart';
import 'package:planner/screens/sign_up/components/user_credentials_page.dart';
import 'package:planner/screens/sign_up/components/user_details_page.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> titles = const ['ACCESS', 'PERSONAL', 'ADDRESS'];
  late int _curStep = 1;
  late Widget child;
  final PageController _pageController = PageController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    emailController.dispose();
    dobController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    mobileNumberController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String snackbarMessage =
        Provider
            .of<SignUpProvider>(context, listen: true)
            .snackbarMessage;
    bool showToast =
        Provider
            .of<SignUpProvider>(context, listen: true)
            .showSnackbar;
    Future.delayed(Duration.zero, () async {
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
            onPressed: () =>
            ScaffoldMessenger
                .of(context)
                .hideCurrentSnackBar,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        context.read<SignUpProvider>().disableSnackBar();
      }
    });
    return Column(
      children: [
        Expanded(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                StepProgressView(
                    width: getProportionateScreenWidth(290.0),
                    curStep: _curStep,
                    color: AppColors.appButtonDarkColor,
                    titles: titles),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      UserCredentialsPage(
                        usernameController: usernameController,
                        passwordController: passwordController,
                        onPressed: _moveToDetailsPage(),
                      ),
                      UserDetailsPage(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        middleNameController: middleNameController,
                        emailController: emailController,
                        dobController: dobController,
                        onBackPress: _onBackPress(0),
                        onNextPress: _moveToAddressPage(),
                      ),
                      UserAddressPage(
                        addressController: addressController,
                        cityController: cityController,
                        countryController: countryController,
                        mobileNumberController: mobileNumberController,
                        onBackPress: _onBackPress(1),
                        onNextPress: _sendServerRequestAndMoveToAuthPage(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  VoidCallback? _moveToDetailsPage() {
    return _onNextPress(true, 1);
  }

  VoidCallback? _moveToAddressPage() {
    return _onNextPress(true, 2);
  }

  VoidCallback? _sendServerRequestAndMoveToAuthPage() {
    return _onNextPress(false, 0);
  }

  VoidCallback? _onNextPress(bool isJump, int animateToPage) {
    return () {
      if (formKey.currentState!.validate()) {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          _curStep += 1;
        });
        if (isJump) {
          _pageController.animateToPage(
            animateToPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        } else {
          var signup = Signup(
              username: usernameController.value.text,
              password: passwordController.value.text,
              middleName: middleNameController.value.text,
              lastName: lastNameController.value.text,
              firstName: firstNameController.value.text,
              mobileNumber: mobileNumberController.value.text,
              country: countryController.value.text,
              city: cityController.value.text,
              address: addressController.value.text,
              dob: dobController.value.text,
              email: emailController.value.text);
          context.read<SignUpProvider>().signup(signup);
          Navigator.pushNamed(context, AppRoutes.authPage);
        }
      }
    };
  }

  VoidCallback? _onBackPress(int animateToPage) {
    return () async {
      setState(() {
        _curStep -= 1;
      });
      _pageController.animateToPage(
        animateToPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    };
  }
}
