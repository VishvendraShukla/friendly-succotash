import 'package:flutter/material.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_globals.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/app_text_form_field.dart';
import 'package:planner/utils/app_text_validator.dart';

class UserAddressPage extends StatefulWidget {
  final VoidCallback? onNextPress;
  final VoidCallback? onBackPress;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController mobileNumberController;

  const UserAddressPage(
      {Key? key,
      required this.onNextPress,
      required this.onBackPress,
      required this.addressController,
      required this.cityController,
      required this.countryController,
      required this.mobileNumberController})
      : super(key: key);

  @override
  UserAddressPageState createState() => UserAddressPageState();
}

class UserAddressPageState extends State<UserAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Address',
                keyboardType: TextInputType.text,
                validatorFunction: AddressValidator.validate,
                obscureText: false,
                textEditingController: widget.addressController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'City',
                keyboardType: TextInputType.text,
                validatorFunction: CityValidator.validate,
                obscureText: false,
                textEditingController: widget.cityController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Country',
                keyboardType: TextInputType.text,
                validatorFunction: CountryValidator.validate,
                obscureText: false,
                textEditingController: widget.countryController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                labelText: 'Mobile Number',
                keyboardType: TextInputType.phone,
                validatorFunction: MobileNumberValidator.validate,
                obscureText: false,
                textEditingController: widget.mobileNumberController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                    heroTag: "backToPersonal",
                    backgroundColor: AppColors.appButtonDarkColor,
                    onPressed: widget.onBackPress,
                    icon: const Icon(Icons.arrow_back),
                    label: AppText(
                      text: 'Back',
                      textStyle: appButtonTextStyle300,
                    ),
                  ),
                  FloatingActionButton.extended(
                    heroTag: "nextFromAddress",
                    backgroundColor: AppColors.appButtonDarkColor,
                    onPressed:  widget.onNextPress,
                    icon: const Icon(Icons.arrow_forward),
                    label: AppText(
                      text: 'Submit',
                      textStyle: appButtonTextStyle300,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
