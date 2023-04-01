import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:planner/models/base_response.dart';
import 'package:planner/rest/api_constants.dart';
import 'package:planner/rest/base/base_service.dart';
import 'package:planner/utils/app_globals.dart';

class TaskCategoryService extends BaseService {
  Future<BaseResponseFormat> fetchTaskCategories() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.taskCategories);
      authToken = await storage.read(key: "authToken");
      var response = await http.get(url, headers: setBearerToken(authToken!));
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<BaseResponseFormat> createUserTaskCategory(Map requestBody) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.createCategory);
      authToken = await storage.read(key: "authToken");
      var response = await http.post(url,
          headers: setBearerToken(authToken!), body: createRequestBody(requestBody));
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<BaseResponseFormat> createUserTask(Map requestBody) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.createTask);
      authToken = await storage.read(key: "authToken");
      var response = await http.post(url,
          headers: setBearerToken(authToken!), body: createRequestBody(requestBody));
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
