import 'package:flutter/material.dart';
import 'package:planner/models/task.dart';
import 'package:planner/screens/task/components/task_description.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/size_config.dart';

class CustomTaskTile extends StatelessWidget {
  CustomTaskTile({
    super.key,
    required this.task,
  });

  late Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: AppColors.appButtonDarkColor,
                  borderRadius: BorderRadius.circular(12)),
              width: 6,
              height: getProportionateScreenHeight(200),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                child: TaskDescription(
                  task: task,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}