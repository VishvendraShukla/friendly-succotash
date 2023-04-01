import 'package:flutter/material.dart';
import 'package:planner/models/task_category.dart';
import 'package:planner/screens/add_task/add_task_page.dart';
import 'package:planner/screens/add_task_category/add_task_category_page.dart';
import 'package:planner/screens/auth/auth_page.dart';
import 'package:planner/screens/home/home_page.dart';
import 'package:planner/screens/landing/landing_page.dart';
import 'package:planner/screens/sign_up/sign_up_page.dart';
import 'package:planner/screens/task/task_page.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text.dart';

class AppRouter {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landingPage:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.authPage:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case AppRoutes.signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.addCategoryPage:
        return MaterialPageRoute(builder: (_) => const AddTaskCategoryPage());
      case AppRoutes.addTaskPage:
        return MaterialPageRoute(
            builder: (_) => AddTaskPage(
                  categoryId: settings.arguments as int,
                ));
      case AppRoutes.taskPage:
        return MaterialPageRoute(
            builder: (_) => TaskPage(
                  taskCategory: settings.arguments as TaskCategory,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: AppText(
                      text: 'Help!! ${settings.name} screen not found',
                      textStyle: appTextStyle300,
                    ),
                  ),
                ));
    }
  }
}
