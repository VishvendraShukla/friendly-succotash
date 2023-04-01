class ErrorMessage {
  late dynamic messageCode;
  late String errorMessage;

  ErrorMessage({required this.errorMessage, required this.messageCode});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
        errorMessage: json['errorMessage'] as dynamic,
        messageCode: json['messageCode'] as String);
  }
}
