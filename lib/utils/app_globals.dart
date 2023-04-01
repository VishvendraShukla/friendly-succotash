import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planner/utils/app_colors.dart';
import 'package:planner/utils/app_text.dart';
import 'package:planner/utils/size_config.dart';

final appTextStyleUsername = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.w600,
    color: AppColors.appWhiteColor);

final appTextStyle700 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(30),
    fontWeight: FontWeight.bold,
    color: AppColors.appTextColor,
    height: 1.5);

final appTextStyle500 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(26),
    fontWeight: FontWeight.w500,
    color: AppColors.appTextColor,
    height: 1);

final appTextStyle300 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(20),
    fontWeight: FontWeight.w400,
    color: AppColors.appTextColor,
    height: 0.5);

final appBarTextStyle = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.appButtonDarkColor);

final appTextStyle300Hyperlink = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(20),
    fontWeight: FontWeight.w300,
    color: Colors.blue,
    height: 0.5);

final appTextStyle100 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(16),
    fontWeight: FontWeight.w300,
    color: AppColors.appTextColor,
    height: 0.5);

final appTextStyle50 = GoogleFonts.montserrat(
  fontSize: getProportionateScreenWidth(14),
  color: AppColors.appTextColor,
);

final appTextStyleWhite50 = GoogleFonts.montserrat(
  fontSize: getProportionateScreenWidth(14),
  color: AppColors.appWhiteColor,
);

final appTextStyleTime = GoogleFonts.montserrat(
  fontSize: getProportionateScreenWidth(14),
  color: AppColors.appWhiteColor,
);

final appButtonTextStyle700 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: AppColors.appWhiteColor,
    height: 1.5);

final appButtonTextStyle500 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(24),
    fontWeight: FontWeight.w500,
    color: AppColors.appWhiteColor,
    height: 1);

final appButtonTextStyle300 = GoogleFonts.montserrat(
    fontSize: getProportionateScreenWidth(20),
    fontWeight: FontWeight.w300,
    color: AppColors.appWhiteColor);

PreferredSizeWidget? createAppBar(final String title, Function() onPressed) {
  return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        onPressed: onPressed,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.appTextMutedColor,
      ),
      centerTitle: true,
      title: AppText(
        text: title,
        textStyle: appBarTextStyle,
      ),
      backgroundColor: AppColors.appWhiteColor,
      elevation: 0.0);
}

final RegExp alphabetRegex = RegExp(r'^[a-zA-Z ]+$');

final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

const String validatorPrefix = "Please Enter";

final months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

const Map<String, String> allStatus = {
  'A': "Active",
  'D': "Done",
  'C': "Created",
  'IA': "Inactive"
};

String currentFormattedDateTime() {
  DateTime now = DateTime.now();
  Object day = (now.day < 10 ? '0${now.day}' : now.day);
  return "$day ${months[now.month - 1]} ${now.year}";
}

String formatDateTime(String dateTime) {
  var parsedDate = DateTime.parse(dateTime);
  Object day = (parsedDate.day < 10 ? '0${parsedDate.day}' : parsedDate.day);
  return "$day ${months[parsedDate.month - 1]} ${parsedDate.year}";
}

String convertStatusToString(String status) {
  return allStatus[status] ?? " ";
}

const storage = FlutterSecureStorage();
