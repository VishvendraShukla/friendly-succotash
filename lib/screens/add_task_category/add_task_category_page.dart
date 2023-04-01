import 'package:flutter/material.dart';
import 'package:planner/screens/add_task_category/components/body.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';

class AddTaskCategoryPage extends StatelessWidget {
  const AddTaskCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createAppBar("Add new Category",
            () => Navigator.popAndPushNamed(context, AppRoutes.home)),
        body: const Body());
  }
}
