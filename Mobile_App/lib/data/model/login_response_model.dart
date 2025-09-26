class LoginResponseModel {
  final String token;

  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromjson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token']);
  }
}
