import 'package:flutter/material.dart';
import 'package:planner/models/task_category.dart';
import 'package:planner/screens/task/components/add_task_button.dart';
import 'package:planner/screens/task/components/body.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';

class TaskPage extends StatelessWidget {
  final TaskCategory taskCategory;

  const TaskPage({super.key, required this.taskCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(taskCategory.categoryName,
          () => Navigator.popAndPushNamed(context, AppRoutes.home)),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Body(
          myList: taskCategory.taskVOList,
        ),
      ]),
      floatingActionButton: AddTaskButton(categoryId: taskCategory.id,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
