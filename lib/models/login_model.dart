/// type : "Success"
/// message : "User created successfully"
/// data : {"user":{"userId":"5f413376-c395-400f-8922-f84c3286636c","firstName":"ali","lastName":"ashraf","email":"aliAsh@gmail.com","imageUrl":"https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png","role":"user"},"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjQxMzM3Ni1jMzk1LTQwMGYtODkyMi1mODRjMzI4NjYzNmMiLCJpYXQiOjE2NjE4MDU2ODQsImV4cCI6MTY2MTk3ODQ4NH0.MqB73qvCFfe-fEYGJ03rMklDTCQwsa4uJGUAwh6fRqo","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjQxMzM3Ni1jMzk1LTQwMGYtODkyMi1mODRjMzI4NjYzNmMiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjE4MDU2ODQsImV4cCI6MTY2MjQxMDQ4NH0.eKPVmJDkwylm2Lwz-seW4elXIiWwBBuSXn9rIzyU9Cg"}

class LoginModel {
  LoginModel({
    String? type,
    String? message,
    DataLogin? data,
  }) {
    _type = type;
    _message = message;
    _data = data;
  }

  LoginModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
  }

  String? _type;
  String? _message;
  DataLogin? _data;

  LoginModel copyWith({
    String? type,
    String? message,
    DataLogin? data,
  }) =>
      LoginModel(
        type: type ?? _type,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get type => _type;

  String? get message => _message;

  DataLogin? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// user : {"userId":"5f413376-c395-400f-8922-f84c3286636c","firstName":"ali","lastName":"ashraf","email":"aliAsh@gmail.com","imageUrl":"https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png","role":"user"}
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjQxMzM3Ni1jMzk1LTQwMGYtODkyMi1mODRjMzI4NjYzNmMiLCJpYXQiOjE2NjE4MDU2ODQsImV4cCI6MTY2MTk3ODQ4NH0.MqB73qvCFfe-fEYGJ03rMklDTCQwsa4uJGUAwh6fRqo"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjQxMzM3Ni1jMzk1LTQwMGYtODkyMi1mODRjMzI4NjYzNmMiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjE4MDU2ODQsImV4cCI6MTY2MjQxMDQ4NH0.eKPVmJDkwylm2Lwz-seW4elXIiWwBBuSXn9rIzyU9Cg"

class DataLogin {
  DataLogin({
    User? user,
    String? accessToken,
    String? refreshToken,
  }) {
    _user = user;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  DataLogin.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }

  User? _user;
  String? _accessToken;
  String? _refreshToken;

  DataLogin copyWith({
    User? user,
    String? accessToken,
    String? refreshToken,
  }) =>
      DataLogin(
        user: user ?? _user,
        accessToken: accessToken ?? _accessToken,
        refreshToken: refreshToken ?? _refreshToken,
      );

  User? get user => _user;

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }
}

/// userId : "5f413376-c395-400f-8922-f84c3286636c"
/// firstName : "ali"
/// lastName : "ashraf"
/// email : "aliAsh@gmail.com"
/// imageUrl : "https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png"
/// role : "user"

class User {
  User({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? imageUrl,
    String? role,
  }) {
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _role = role;
  }

  User.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _role = json['role'];
  }

  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  String? _role;

  User copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? imageUrl,
    String? role,
  }) =>
      User(
        userId: userId ?? _userId,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        imageUrl: imageUrl ?? _imageUrl,
        role: role ?? _role,
      );

  String? get userId => _userId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get imageUrl => _imageUrl;

  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['imageUrl'] = _imageUrl;
    map['role'] = _role;
    return map;
  }
}
