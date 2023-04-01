import 'dart:convert';
import 'dart:core';

import 'package:planner/models/base_response.dart';

class BaseService {
  String? token = "";
  String? authToken = " ";

  Map<String, String>? setHeaders() {
    Map<String, String> headers = {"Content-Type": "application/json"};
    return headers;
  }

  Map<String, String>? setBearerToken(String authToken) {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    return headers;
  }

  Object? createRequestBody(Map data) {
    return json.encode(data);
  }

  BaseResponseFormat getBaseResponseFormat(String responseBody) {
    return BaseResponseFormat.fromJson(jsonDecode(responseBody));
  }
}
