import 'package:flutter/material.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/screens/add_task/components/body.dart';


class AddTaskPage extends StatelessWidget {
  final int categoryId;
  const AddTaskPage({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        createAppBar("Add new Task", () => Navigator.of(context).pop()),
        body: Body(categoryId: categoryId,)
    );
  }
}