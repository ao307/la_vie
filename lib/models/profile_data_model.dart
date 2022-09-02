import 'dart:convert';
/// type : "Success"
/// message : "User fetched successfully"
/// data : {"userId":"2e4b988f-f87c-43f2-8ae3-ddab0a99bbad","firstName":"ali","lastName":"ashraf","email":"ass@gm.com","imageUrl":"https://i.ibb.co/QNY4y27/a.jpg","role":"user","UserPoints":30}

ProfileDataModel profileDataModelFromJson(String str) => ProfileDataModel.fromJson(json.decode(str));
String profileDataModelToJson(ProfileDataModel data) => json.encode(data.toJson());
class ProfileDataModel {
  ProfileDataModel({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  ProfileDataModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
ProfileDataModel copyWith({  String? type,
  String? message,
  Data? data,
}) => ProfileDataModel(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get type => _type;
  String? get message => _message;
  Data? get data => _data;

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

/// userId : "2e4b988f-f87c-43f2-8ae3-ddab0a99bbad"
/// firstName : "ali"
/// lastName : "ashraf"
/// email : "ass@gm.com"
/// imageUrl : "https://i.ibb.co/QNY4y27/a.jpg"
/// role : "user"
/// UserPoints : 30

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? userId, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? imageUrl, 
      String? role, 
      num? userPoints,}){
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _role = role;
    _userPoints = userPoints;
}

  Data.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _role = json['role'];
    _userPoints = json['UserPoints'];
  }
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  String? _role;
  num? _userPoints;
Data copyWith({  String? userId,
  String? firstName,
  String? lastName,
  String? email,
  String? imageUrl,
  String? role,
  num? userPoints,
}) => Data(  userId: userId ?? _userId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  imageUrl: imageUrl ?? _imageUrl,
  role: role ?? _role,
  userPoints: userPoints ?? _userPoints,
);
  String? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get imageUrl => _imageUrl;
  String? get role => _role;
  num? get userPoints => _userPoints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['imageUrl'] = _imageUrl;
    map['role'] = _role;
    map['UserPoints'] = _userPoints;
    return map;
  }

}