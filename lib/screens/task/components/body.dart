import 'package:flutter/material.dart';
import 'package:planner/models/task.dart';
import 'package:planner/screens/task/components/custom_task_tile.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/size_config.dart';

class Body extends StatelessWidget {
  late List<Task> myList;

  Body({Key? key, required this.myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return handleEmptyListAndBuild();
  }

  Widget handleEmptyListAndBuild() {
    if (myList.isEmpty) {
      return buildImageIfEmptyList();
    } else {
      return buildTileView();
    }
  }

  Widget buildImageIfEmptyList() {
    return Center(
      child: Column(children: [
        const SizedBox(height: 70),
        Image.asset("lib/assets/images/empty_task_list_filler.png",
            width: getProportionateScreenWidth(200)),
        const SizedBox(height: 20),
        AppText(
          text: 'Let\'s Add Some Tasks...',
          textStyle: appTextStyle500,
        ),
      ]),
    );
  }

  Widget buildTileView() {
    return Expanded(
      child: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(-6, -6),
                        spreadRadius: 0,
                        blurRadius: 10),
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(6, 6),
                        spreadRadius: 0,
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(12)),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[CustomTaskTile(task: myList[index])],
              ),
            );
          }),
    );
  }
}
