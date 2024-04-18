class RegisterUser {
 late String tokenType;
 late int expiresIn;
 late String accessToken;
 late  String refreshToken;


  RegisterUser.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }


}