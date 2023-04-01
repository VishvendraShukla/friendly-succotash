import 'package:flutter/material.dart';
import 'package:planner/screens/home/components/add_category_button.dart';
import 'package:planner/screens/home/components/body.dart';
import 'package:planner/utils/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: Body(),
        floatingActionButton: AddCategoryButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

}
