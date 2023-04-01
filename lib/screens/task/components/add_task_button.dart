import 'package:flutter/material.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';

class AddTaskButton extends StatelessWidget {
  late int categoryId;
  AddTaskButton({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.appButtonDarkColor,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addTaskPage);
      },
      icon: const Icon(Icons.add),
      label: AppText(
        text: 'Add New Task',
        textStyle: appButtonTextStyle300,
      ),
    );
  }
}
