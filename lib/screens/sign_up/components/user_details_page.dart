import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_form_field_date_picker.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/app_text_form_field.dart';
import 'package:planner/utils/app_text_validator.dart';

class UserDetailsPage extends StatefulWidget {
  final VoidCallback? onNextPress;
  final VoidCallback? onBackPress;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController middleNameController;
  final TextEditingController emailController;
  final TextEditingController dobController;

  const UserDetailsPage(
      {Key? key,
      required this.onNextPress,
      required this.onBackPress,
      required this.firstNameController,
      required this.lastNameController,
      required this.middleNameController,
      required this.emailController,
      required this.dobController})
      : super(key: key);

  @override
  UserDetailsPageState createState() => UserDetailsPageState();
}

class UserDetailsPageState extends State<UserDetailsPage> {

  @override
  void initState() {
    if(widget.dobController.text.isEmpty) {
      widget.dobController.text = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'First name',
                keyboardType: TextInputType.text,
                validatorFunction: FirstNameValidator.validate,
                obscureText: false,
                textEditingController: widget.firstNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Middle Name',
                keyboardType: TextInputType.text,
                obscureText: false,
                textEditingController: widget.middleNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Last Name',
                keyboardType: TextInputType.text,
                validatorFunction: LastNameValidator.validate,
                obscureText: false,
                textEditingController: widget.lastNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Email',
                keyboardType: TextInputType.text,
                validatorFunction: EmailValidator.validate,
                obscureText: false,
                textEditingController: widget.emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppFormFieldDatePicker(
                labelText: "DOB",
                keyboardType: TextInputType.none,
                textEditingController: widget.dobController,
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
                    widget.dobController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate!);
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                    heroTag: "backToCredentials",
                    backgroundColor: AppColors.appButtonDarkColor,
                    onPressed: widget.onBackPress,
                    icon: const Icon(Icons.arrow_back),
                    label: AppText(
                      text: 'Back',
                      textStyle: appButtonTextStyle300,
                    ),
                  ),
                  FloatingActionButton.extended(
                    heroTag: "nextFromPersonal",
                    backgroundColor: AppColors.appButtonDarkColor,
                    onPressed: widget.onNextPress,
                    icon: const Icon(Icons.arrow_forward),
                    label: AppText(
                      text: 'Next',
                      textStyle: appButtonTextStyle300,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
