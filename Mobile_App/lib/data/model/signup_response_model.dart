class SignupResponseModel {
  final String token;

  SignupResponseModel({required this.token});

  factory SignupResponseModel.fromjson(Map<String, dynamic> json) {
    return SignupResponseModel(token: json['token']);
  }
}
