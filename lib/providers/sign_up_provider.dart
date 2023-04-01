import 'package:flutter/material.dart';
import 'package:planner/models/base_response.dart';
import 'package:planner/models/sign_up_vo.dart';
import 'package:planner/rest/sign_up/sign_up_service.dart';

class SignUpProvider extends ChangeNotifier {
  bool _obscured = true;
  bool _showSnackbar = false;
  String _value = "";
  String _message = "";
  final SignUpService _signUpService = SignUpService();
  bool get showSnackbar => _showSnackbar;
  String get snackbarMessage => _message;

  bool get obscured => _obscured;

  String get value => _value;

  void toggleObscured() {
    _obscured = !_obscured;
    notifyListeners();
  }

  void displayMessage(String message) {
    _showSnackbar = true;
    _message = message;
    notifyListeners();
  }

  void saveValue(String value) {
    _value = value;
  }

  void disableSnackBar() {
    _showSnackbar = false;
    notifyListeners();
  }

  void signup(Signup signup) async {
    late BaseResponseFormat apiResponse;
    late String message;
    try {
      apiResponse = await _signUpService.signup(signup.getSignUpRequestBody());
      if (apiResponse.status) {
        message = apiResponse.payload as String;
      }
    } catch (e) {
      message = "Something Went Wrong";
    }
    displayMessage(message);
  }
}
