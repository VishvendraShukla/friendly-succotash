import 'package:flutter/material.dart';
import 'package:planner/models/task.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';

class TaskDescription extends StatelessWidget {
  TaskDescription({
    super.key,
    required this.task,
  });

  late Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(text: task.description, textStyle: appTextStyle300),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AppText(
                  text: convertStatusToString(task.status),
                  textStyle: appTextStyle300),
              const SizedBox(height: 20,),
              AppText(
                text: formatDateTime(task.dueDate),
                textStyle: appTextStyle300,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
