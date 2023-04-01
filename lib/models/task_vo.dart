class TaskVO {
  late String taskCategoryId;
  late String description;
  late String dueDate;
  late String status;

  TaskVO(
      {required this.taskCategoryId,
      required this.description,
      required this.dueDate,
      required this.status});

  Map getTaskRequestBody() {
    Map data = {
      'taskCategoryId': taskCategoryId,
      'description': description,
      'dueDate': dueDate,
      'status': status,
    };
    return data;
  }
}
