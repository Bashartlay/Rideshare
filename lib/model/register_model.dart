class User {
  String firstName;
  String lastName;
  String phone;
  String username;
  String birthDate;
  String password;
  String confirmPassword;
  String? gender;

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.birthDate,
    required this.password,
    required this.confirmPassword,
    this.gender, 
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      username: json['username'],
      birthDate: json['birthDate'],
      password: '',
      confirmPassword: '', 
      gender: json['gender'], 
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'username': username,
      'birthDate': birthDate,
      'password': password,
      'confirmPassword': confirmPassword,
      'gender': gender,
    };
  }
}
