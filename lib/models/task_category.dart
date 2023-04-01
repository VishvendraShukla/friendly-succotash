import 'package:planner/models/task.dart';

class TaskCategory {
  late int id;
  late String categoryName;
  late String categoryType;
  late List<Task> taskVOList;

  TaskCategory(
      {required this.id,
      required this.categoryName,
      required this.categoryType,
      required this.taskVOList});

  factory TaskCategory.fromJson(Map<String, dynamic> json) {
    List<Task> taskVOList = [];
    if (json['taskVOList'] != null) {
      for (var taskVO in json['taskVOList']) {
        taskVOList.add(Task.fromJson(taskVO));
      }
    }
    return TaskCategory(
        id: json['id'] as int,
        categoryName: json['categoryName'] as String,
        categoryType: json['categoryType'] as String,
        taskVOList: taskVOList);
  }
}
