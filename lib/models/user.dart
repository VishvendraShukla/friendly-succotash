class User {
  late String username;
  late int id;
  late String lastModified;
  late String userType;

  User(
      {required this.username,
      required this.id,
      required this.lastModified,
      required this.userType});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'] as String,
        id: json['id'] as int,
        lastModified: json['lastModified'] as String,
        userType: json['userType'] as String);
  }
}
