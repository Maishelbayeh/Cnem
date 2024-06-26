class User {
  final String userName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  User({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
