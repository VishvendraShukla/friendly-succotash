import 'package:flutter/material.dart';
import 'package:planner/utils/app_button.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "lib/assets/images/landing_page_filler.png",
                      width: getProportionateScreenWidth(200),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 16, right: 16, top: 30),
                    child: Column(
                      children: [
                        Center(
                          child: AppText(
                            text: "Meet PLANNER",
                            textStyle: appTextStyle700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: AppText(
                            text: "For all your \"organized\" needs!",
                            textStyle: appTextStyle300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  text: 'Let\'s Start ',
                  buttonTextStyle: appButtonTextStyle300,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.authPage),
                )
              ],
            ),
          )
        ],
      );
  }
}
