import 'package:flutter/material.dart';
import 'package:planner/models/task_category.dart';
import 'package:planner/providers/task_category_provider.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/size_config.dart';
import 'package:provider/provider.dart';

class ListTileView extends StatelessWidget {
  const ListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<TaskCategory>> getData() async {
      List<TaskCategory> myList = [];
      myList =
          await Future.delayed((const Duration(milliseconds: 200)), () async {
        return Provider.of<TaskCategoryProvider>(context, listen: false)
            .fetchUserTaskCategories();
      });
      return myList;
    }

    return FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data as List<TaskCategory>;
              return buildTaskCategoryView(data);
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData());
  }

  Widget buildTaskCategoryView(List<TaskCategory> myList) {
    Widget widget;
    if (myList.isEmpty) {
      widget = Center(
        child: Column(children: [
          const SizedBox(height: 70),
          Image.asset("lib/assets/images/empty_task_list_filler.png",
              width: getProportionateScreenWidth(200)),
          const SizedBox(height: 20),
          AppText(
            text: 'Let\'s Add Some Categories...',
            textStyle: appTextStyle500,
          ),
        ]),
      );
    } else {
      widget = Expanded(
        child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.taskPage,
                    arguments: myList[index]),
                child: Container(
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
                  child: ListTile(
                    trailing: const Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                    title: AppText(
                      text: (myList[index].categoryName),
                      textStyle: appTextStyle300,
                    ),
                    subtitle: AppText(
                      text: (myList[index].categoryType),
                      textStyle: appTextStyle100,
                    ),
                  ),
                ),
              );
            }),
      );
    }
    return widget;
  }
}
