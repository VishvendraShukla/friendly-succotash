import 'package:flutter/material.dart';
import 'package:planner/utils/app_globals.dart';

import 'components/body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createAppBar('Sign Up', () => Navigator.of(context).pop()),
        resizeToAvoidBottomInset: false,
        body: const Body());
  }
}
