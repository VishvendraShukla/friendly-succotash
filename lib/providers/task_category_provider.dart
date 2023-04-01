import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planner/models/base_response.dart';
import 'package:planner/models/task_category.dart';
import 'package:planner/models/task_category_vo.dart';
import 'package:planner/models/task_vo.dart';
import 'package:planner/rest/task/task_category_service.dart';

class TaskCategoryProvider with ChangeNotifier {
  final TaskCategoryService _taskCategoryService = TaskCategoryService();
  List<TaskCategory> _myList = [];

  List<TaskCategory> get list => _myList;
  bool _showSnackbar = false;
  String _message = "";
  bool get showSnackbar => _showSnackbar;
  String get snackbarMessage => _message;

  void displayMessage(String message) {
    _showSnackbar = true;
    _message = message;
    notifyListeners();
  }

  void disableSnackBar() {
    _showSnackbar = false;
    notifyListeners();
  }

  Future<List<TaskCategory>> fetchUserTaskCategories() async {
    late BaseResponseFormat apiResponse;
    apiResponse = await _taskCategoryService.fetchTaskCategories();
    if (apiResponse.status) {
      _myList = parseResponse(apiResponse.payload);
    }
    return _myList;
  }

  void createUserTaskCategory(TaskCategoryVO taskCategory) async {
    late BaseResponseFormat apiResponse;
    late String message;
    try {
      apiResponse = await _taskCategoryService.createUserTaskCategory(taskCategory.getTaskCategoryRequestBody());
      if (apiResponse.status) {
        message = apiResponse.payload as String;
      }
    } catch (e) {
      message = "Something Went Wrong";
    }
    displayMessage(message);
  }

  void createUserTask(TaskVO taskVO) async {
    late BaseResponseFormat apiResponse;
    late String message;
    try {
      apiResponse = await _taskCategoryService.createUserTask(taskVO.getTaskRequestBody());
      if (apiResponse.status) {
        message = apiResponse.payload as String;
      }
    } catch (e) {
      message = "Something Went Wrong";
    }
    displayMessage(message);
  }

  List<TaskCategory> parseResponse(dynamic data) {
    List<dynamic> elements = data;
    List<TaskCategory> taskCategoryList = [];
    for (var element in elements) {
      taskCategoryList.add(TaskCategory.fromJson(element));
    }
    return taskCategoryList;
  }
}
