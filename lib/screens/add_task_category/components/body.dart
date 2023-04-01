import 'package:flutter/material.dart';
import 'package:planner/models/task_category_vo.dart';
import 'package:planner/providers/task_category_provider.dart';
import 'package:planner/utils/app_button.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text_form_field.dart';
import 'package:planner/utils/app_text_validator.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController categoryNameController = TextEditingController();
    TextEditingController categoryTypeController = TextEditingController();
    return SafeArea(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              AppTextFormField(
                labelText: 'Category Name',
                keyboardType: TextInputType.text,
                obscureText: false,
                validatorFunction: CategoryNameValidator.validate,
                textEditingController: categoryNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Category Type',
                keyboardType: TextInputType.text,
                obscureText: false,
                textEditingController: categoryTypeController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                text: "Add Category",
                buttonTextStyle: appButtonTextStyle300,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var newCategory = TaskCategoryVO(
                        taskCategoryType: categoryTypeController.value.text,
                        taskCategoryName: categoryNameController.value.text);
                    context
                        .read<TaskCategoryProvider>()
                        .createUserTaskCategory(newCategory);
                    Navigator.popAndPushNamed(context, AppRoutes.home);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
