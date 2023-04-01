import 'package:flutter/material.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/size_config.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.appButtonDarkColor,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addCategoryPage);
      },
      icon: Image.asset(
        "lib/assets/icons/add_category.png",
        width: getProportionateScreenWidth(20),
        color: AppColors.appWhiteColor,
      ),
      label: AppText(
        text: 'Add Category',
        textStyle: appButtonTextStyle300,
      ),
    );
  }
}
