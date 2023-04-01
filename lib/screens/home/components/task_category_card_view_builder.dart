import 'package:flutter/material.dart';
import 'package:planner/screens/home/components/list_tile_view.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';

class TaskCategoryCardViewBuilder extends StatelessWidget {
  const TaskCategoryCardViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AppText(text: "Your Categories", textStyle: appTextStyle500),
          const ListTileView(),
        ],
      ),
    );
  }
}
