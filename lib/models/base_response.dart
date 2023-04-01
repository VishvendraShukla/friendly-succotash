import 'package:planner/models/error_message.dart';

class BaseResponseFormat {
  late bool status;
  late bool userBlocked;
  late dynamic payload;
  late bool passwordExpired;
  late dynamic timeStamp;
  ErrorMessage? errorMessage;

  BaseResponseFormat(
      {required this.status,
      required this.userBlocked,
      required this.payload,
      required this.passwordExpired,
      required this.timeStamp,
      this.errorMessage});

  factory BaseResponseFormat.fromJson(Map<String, dynamic> json) {
    ErrorMessage error;
    if (json['error'] != null) {
      error = ErrorMessage.fromJson(json['error']);
      return BaseResponseFormat(
          status: json['status'] as bool,
          userBlocked: json['userBlocked'] as bool,
          payload: json['payload'] as dynamic,
          passwordExpired: json['passwordExpired'] as bool,
          timeStamp: json['timeStamp'] as dynamic,
          errorMessage: error);
    }
    return BaseResponseFormat(
      status: json['status'] as bool,
      userBlocked: json['userBlocked'] as bool,
      payload: json['payload'] as dynamic,
      passwordExpired: json['passwordExpired'] as bool,
      timeStamp: json['timeStamp'] as dynamic,
    );
  }
}
