class Session {
  late String userName;
  late String accessToken;
  late String tokenType;
  late int expiresIn;
  late String refreshToken;
  late String authToken;
  late DateTime issued;
  late DateTime expires;

  static final Session _instance = Session._internal();

  Session._internal();

  factory Session(String userName,
  String accessToken,
  String tokenType,
  int expiresIn,
  String refreshToken,
  String authToken,
  DateTime issued,
  DateTime expires
) {
  _instance.userName=userName;
    _instance.accessToken=accessToken;
    _instance.tokenType=tokenType; 
    _instance.expiresIn=expiresIn;   
    _instance.refreshToken=refreshToken;
    _instance.authToken=authToken;
    _instance.issued=issued;    
    _instance.expires=expires;


    return _instance;
  }

  factory Session.current(){
    return _instance;
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
        json['userName'],
        json['access_token'],
        json['token_type'],
        json['expires_in'],
        json['refresh_token'],
        json['AuthToken'],        
        DateTime.parse(json['.issued']),
        DateTime.parse(json['.expires']));
  }

}
