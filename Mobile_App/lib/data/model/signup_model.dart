class SignupModel {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignupModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
}
