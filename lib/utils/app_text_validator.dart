import 'package:planner/utils/app_globals.dart';

class PasswordValidator {
  static String? validate(String? value) {
    return value == null || value.isEmpty ? "$validatorPrefix Password" : null;
  }
}

class FirstNameValidator {
  static String? validate(String? value) {
    return value == null || value.isEmpty
        ? "$validatorPrefix First Name"
        : null;
  }
}

class LastNameValidator {
  static String? validate(String? value) {
    return value == null || value.isEmpty ? "$validatorPrefix Last Name" : null;
  }
}

class EmailValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix Email';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }
}

class AddressValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix Address';
    }
    return null;
  }
}

class CityValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix city';
    }
    return null;
  }
}

class CountryValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix country';
    }
    return null;
  }
}

class MobileNumberValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix Mobile Number';
    }
    if (alphabetRegex.hasMatch(value) || value.length > 10) {
      return 'Invalid Mobile Number';
    }
    return null;
  }
}

class UsernameValidator {
  static String? validate(String? value) {
    return value == null || value.isEmpty
        ? "$validatorPrefix Username"
        : null;
  }
}

class CategoryNameValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix Category Name';
    }
    return null;
  }
}

class TaskNameValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return '$validatorPrefix Task Name';
    }
    return null;
  }
}