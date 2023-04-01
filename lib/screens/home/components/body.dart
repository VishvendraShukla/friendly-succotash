import 'package:flutter/material.dart';
import 'package:planner/screens/home/components/home_page_name_view.dart';
import 'package:planner/screens/home/components/task_category_card_view_builder.dart';
import 'package:planner/utils/app_colors.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appButtonDarkColor,
      child: Column(
        children: [
          const HomePageNameViewBuilder(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: AppColors.appWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: const TaskCategoryCardViewBuilder(),
          )),
        ],
      ),
    );
  }
}
