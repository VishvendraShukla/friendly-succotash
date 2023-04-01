import 'package:flutter/material.dart';
import 'package:planner/providers/auth_provider.dart';
import 'package:planner/providers/sign_up_provider.dart';
import 'package:planner/providers/task_category_provider.dart';
import 'package:planner/utils/app_router.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskCategoryProvider>(
            create: (_) => TaskCategoryProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.landingPage,
        onGenerateRoute: AppRouter.onGeneratedRoute,
      ),
    );
  }
}
