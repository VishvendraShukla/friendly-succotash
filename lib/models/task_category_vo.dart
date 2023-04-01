class TaskCategoryVO {
  late String taskCategoryType;
  late String taskCategoryName;

  TaskCategoryVO(
      {required this.taskCategoryType, required this.taskCategoryName});

  Map getTaskCategoryRequestBody() {
    Map data = {
      'categoryType': taskCategoryType,
      'categoryName': taskCategoryName
    };
    return data;
  }
}
