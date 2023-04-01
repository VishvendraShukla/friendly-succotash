import 'package:flutter/material.dart';
import 'package:planner/screens/auth/components/body.dart';
import 'package:planner/utils/size_config.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }


}
