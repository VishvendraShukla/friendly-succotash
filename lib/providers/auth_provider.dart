import 'package:flutter/material.dart';
import 'package:planner/models/base_response.dart';
import 'package:planner/models/user.dart';
import 'package:planner/rest/auth/authentication_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _obscured = true;
  String _value = "";
  bool get obscured => _obscured;
  String get value => _value;
  bool _isVisible = false;
  bool _login = false;
  User? _user;
  String _message = " ";
  bool _showSnackbar = false;
  final AuthenticationService _authenticationService = AuthenticationService();

  bool get showPassword => _isVisible;

  User? get authorizedUser => _user;

  bool get canLogin => _login;

  bool get showSnackbar => _showSnackbar;

  String get snackbarMessage => _message;

  void toggleVisibility(bool toggle) {
    _isVisible = toggle;
    notifyListeners();
  }

  void displayMessage(String message) {
    _showSnackbar = true;
    _message = message;
    notifyListeners();
  }

  void toggleLogin(bool toggle) {
    _login = toggle;
    notifyListeners();
  }

  void toggleObscured() {
    _obscured = !_obscured;
    notifyListeners();
  }

  void saveValue(String value) {
    _value = value;
  }

  void disableSnackBar() {
    _showSnackbar = false;
    notifyListeners();
  }

  void verifyUsername(String username) async {
    late BaseResponseFormat apiResponse;
    try {
      apiResponse = await _authenticationService.verifyUsername(username);
      if (apiResponse.status) {
        displayMessage(apiResponse.payload as String);
        toggleVisibility(true);
      } else {
        toggleVisibility(false);
        displayMessage("Invalid Username");
      }
    } catch (e) {
      toggleVisibility(false);
      displayMessage("Invalid Username");
    }
  }

  void verifyUserAndLogin(String username, String password) async {
    late BaseResponseFormat apiResponse;
    try {
      apiResponse = await _authenticationService.verifyUser(username, password);
      if (apiResponse.status) {
        displayMessage(apiResponse.payload as String);
        apiResponse = await _authenticationService.login(username, password);
        if (apiResponse.status) {
          _user = User.fromJson(apiResponse.payload);
          displayMessage("Welcome ${_user?.username}!");
          toggleLogin(true);
        }
      }
    } catch (e) {
      toggleVisibility(false);
      displayMessage("Invalid credentials");
    }
  }
}
