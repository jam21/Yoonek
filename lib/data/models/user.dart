import 'package:yoonek/domain/entities/session.dart';

class SessionModel extends Session {
  SessionModel(
      {required super.userName,
      required super.accessToken,
      required super.tokenType,
      required super.expiresIn,
      required super.refreshToken,
      required super.authToken,
      required super.expires,
      required super.issued});
  
  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
        userName: json['userName'],
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in'],
        refreshToken: json['refresh_token'],
        authToken: json['AuthToken'],
        expires: DateTime.parse(json['.expires']),
        issued: DateTime.parse(json['.issued']));
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn
    };
  }
}
