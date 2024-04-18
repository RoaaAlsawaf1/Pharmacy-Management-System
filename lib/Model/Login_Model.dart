class LoginModel {
  late String tokenType;
  late int expiresIn;
  late String accessToken;
  late  String refreshToken;


  LoginModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }


}