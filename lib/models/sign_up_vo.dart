class Signup {
  late String username;
  late String password;
  late String middleName;
  late String lastName;
  late String firstName;
  late String mobileNumber;
  late String country;
  late String city;
  late String address;
  late String dob;
  late String email;

  Signup(
      {required this.username,
      required this.password,
      required this.middleName,
      required this.lastName,
      required this.firstName,
      required this.mobileNumber,
      required this.country,
      required this.city,
      required this.address,
      required this.dob,
      required this.email});

  Map getSignUpRequestBody() {
    Map user = {'username': username, 'password': password};
    Map details = {
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'email': email,
      'dob': dob,
      'address': address,
      'city': city,
      'country': country,
      'mobileNumber': mobileNumber
    };
    Map data = {'user': user, 'details': details};
    return data;
  }
}
