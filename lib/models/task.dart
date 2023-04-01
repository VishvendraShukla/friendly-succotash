class Task {
  late int id;
  late String description;
  late String status;
  late String dueDate;

  Task(
      {required this.id,
      required this.description,
      required this.status,
      required this.dueDate});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'] as int,
        description: json['description'] as String,
        status: json['status'] as String,
        dueDate: json['dueDate'] as String);
  }
}
