import 'package:flutter/material.dart';
import 'package:planner/providers/auth_provider.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';
import 'package:provider/provider.dart';

class HomePageNameViewBuilder extends StatelessWidget {
  const HomePageNameViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          }
          else if (snapshot.hasData) {
            final data = snapshot.data as String;
            return buildNameView(data);
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: Future.delayed(const Duration(seconds: 0), () {
        return context.read<AuthProvider>().authorizedUser?.username;
      }),
    );
  }

  Widget buildNameView(String username) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    text: 'Hi! $username',
                    textStyle: appTextStyleUsername,
                  ),
                  AppText(
                    text: currentFormattedDateTime(),
                    textStyle: appTextStyleTime,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
