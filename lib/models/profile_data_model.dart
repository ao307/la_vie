class ProfileDataModel {
  ProfileDataModel({
    String? type,
    String? message,
    ProfileData? data,
  }) {
    _type = type;
    _message = message;
    _data = data;
  }

  ProfileDataModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  String? _type;
  String? _message;
  ProfileData? _data;

  ProfileDataModel copyWith({
    String? type,
    String? message,
    ProfileData? data,
  }) =>
      ProfileDataModel(
        type: type ?? _type,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get type => _type;

  String? get message => _message;

  ProfileData? get data => _data;

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

class ProfileData {
  ProfileData({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? imageUrl,
    String? role,
    num? userPoints,
    List<UserNotification>? userNotification,
  }) {
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _role = role;
    _userPoints = userPoints;
    _userNotification = userNotification;
  }

  ProfileData.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _role = json['role'];
    _userPoints = json['UserPoints'];
    if (json['UserNotification'] != null) {
      _userNotification = [];
      json['UserNotification'].forEach((v) {
        _userNotification?.add(UserNotification.fromJson(v));
      });
    }
  }

  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  String? _role;
  num? _userPoints;
  List<UserNotification>? _userNotification;

  ProfileData copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? imageUrl,
    String? role,
    num? userPoints,
    List<UserNotification>? userNotification,
  }) =>
      ProfileData(
        userId: userId ?? _userId,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        imageUrl: imageUrl ?? _imageUrl,
        role: role ?? _role,
        userPoints: userPoints ?? _userPoints,
        userNotification: userNotification ?? _userNotification,
      );

  String? get userId => _userId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get imageUrl => _imageUrl;

  String? get role => _role;

  num? get userPoints => _userPoints;

  List<UserNotification>? get userNotification => _userNotification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['imageUrl'] = _imageUrl;
    map['role'] = _role;
    map['UserPoints'] = _userPoints;
    if (_userNotification != null) {
      map['UserNotification'] =
          _userNotification?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserNotification {
  UserNotification({
    String? notificationId,
    String? userId,
    String? imageUrl,
    String? message,
    String? createdAt,
  }) {
    _notificationId = notificationId;
    _userId = userId;
    _imageUrl = imageUrl;
    _message = message;
    _createdAt = createdAt;
  }

  UserNotification.fromJson(dynamic json) {
    _notificationId = json['notificationId'];
    _userId = json['userId'];
    _imageUrl = json['imageUrl'];
    _message = json['message'];
    _createdAt = json['createdAt'];
  }

  String? _notificationId;
  String? _userId;
  String? _imageUrl;
  String? _message;
  String? _createdAt;

  UserNotification copyWith({
    String? notificationId,
    String? userId,
    String? imageUrl,
    String? message,
    String? createdAt,
  }) =>
      UserNotification(
        notificationId: notificationId ?? _notificationId,
        userId: userId ?? _userId,
        imageUrl: imageUrl ?? _imageUrl,
        message: message ?? _message,
        createdAt: createdAt ?? _createdAt,
      );

  String? get notificationId => _notificationId;

  String? get userId => _userId;

  String? get imageUrl => _imageUrl;

  String? get message => _message;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notificationId'] = _notificationId;
    map['userId'] = _userId;
    map['imageUrl'] = _imageUrl;
    map['message'] = _message;
    map['createdAt'] = _createdAt;
    return map;
  }
}
