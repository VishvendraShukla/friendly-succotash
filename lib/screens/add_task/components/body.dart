import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/models/task_vo.dart';
import 'package:planner/providers/task_category_provider.dart';
import 'package:planner/utils/app_button.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_form_field_date_picker.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_routes.dart';
import 'package:planner/utils/app_text_form_field.dart';
import 'package:planner/utils/app_text_validator.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final int categoryId;

  Body({Key? key, required this.categoryId}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  void initState() {
    if (widget.dueDateController.text.isEmpty) {
      widget.dueDateController.text = "";
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.taskNameController.dispose();
    widget.taskDescriptionController.dispose();
    widget.dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              AppTextFormField(
                labelText: 'Task Name',
                keyboardType: TextInputType.text,
                obscureText: false,
                validatorFunction: TaskNameValidator.validate,
                textEditingController: widget.taskNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Task description',
                keyboardType: TextInputType.text,
                obscureText: false,
                textEditingController: widget.taskDescriptionController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppFormFieldDatePicker(
                labelText: "Due Date",
                keyboardType: TextInputType.none,
                textEditingController: widget.dueDateController,
                datePickerFunc: () async {
                  DateTime? pickedDate = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.appButtonDarkColor,
                              onPrimary: AppColors.appWhiteColor,
                              onSurface: AppColors.appButtonDarkColor,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2101));
                  setState(() {
                    widget.dueDateController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate!);
                  });
                },
              ),
              AppButton(
                text: "Add Task",
                buttonTextStyle: appButtonTextStyle300,
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    var taskVO = TaskVO(
                        taskCategoryId: widget.categoryId.toString(),
                        description:
                            widget.taskDescriptionController.value.text,
                        dueDate: widget.dueDateController.value.text,
                        status: 'ACTIVE');
                    context.read<TaskCategoryProvider>().createUserTask(taskVO);
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
