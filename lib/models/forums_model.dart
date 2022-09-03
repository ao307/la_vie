class ForumsModel {
  ForumsModel({
      String? type, 
      String? message, 
      List<ForumData>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  ForumsModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ForumData.fromJson(v));
      });
    }
  }
  String? _type;
  String? _message;
  List<ForumData>? _data;
ForumsModel copyWith({  String? type,
  String? message,
  List<ForumData>? data,
}) => ForumsModel(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get type => _type;
  String? get message => _message;
  List<ForumData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ForumData {
  ForumData({
      String? forumId, 
      String? title, 
      String? description, 
      String? imageUrl, 
      String? userId, 
      List<ForumLikes>? forumLikes, 
      List<ForumComments>? forumComments, 
      ForumUser? user,}){
    _forumId = forumId;
    _title = title;
    _description = description;
    _imageUrl = imageUrl;
    _userId = userId;
    _forumLikes = forumLikes;
    _forumComments = forumComments;
    _user = user;
}

  ForumData.fromJson(dynamic json) {
    _forumId = json['forumId'];
    _title = json['title'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _userId = json['userId'];
    if (json['ForumLikes'] != null) {
      _forumLikes = [];
      json['ForumLikes'].forEach((v) {
        _forumLikes?.add(ForumLikes.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      _forumComments = [];
      json['ForumComments'].forEach((v) {
        _forumComments?.add(ForumComments.fromJson(v));
      });
    }
    _user = json['user'] != null ? ForumUser.fromJson(json['user']) : null;
  }
  String? _forumId;
  String? _title;
  String? _description;
  String? _imageUrl;
  String? _userId;
  List<ForumLikes>? _forumLikes;
  List<ForumComments>? _forumComments;
  ForumUser? _user;
ForumData copyWith({  String? forumId,
  String? title,
  String? description,
  String? imageUrl,
  String? userId,
  List<ForumLikes>? forumLikes,
  List<ForumComments>? forumComments,
  ForumUser? user,
}) => ForumData(  forumId: forumId ?? _forumId,
  title: title ?? _title,
  description: description ?? _description,
  imageUrl: imageUrl ?? _imageUrl,
  userId: userId ?? _userId,
  forumLikes: forumLikes ?? _forumLikes,
  forumComments: forumComments ?? _forumComments,
  user: user ?? _user,
);
  String? get forumId => _forumId;
  String? get title => _title;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  String? get userId => _userId;
  List<ForumLikes>? get forumLikes => _forumLikes;
  List<ForumComments>? get forumComments => _forumComments;
  ForumUser? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumId'] = _forumId;
    map['title'] = _title;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['userId'] = _userId;
    if (_forumLikes != null) {
      map['ForumLikes'] = _forumLikes?.map((v) => v.toJson()).toList();
    }
    if (_forumComments != null) {
      map['ForumComments'] = _forumComments?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

class ForumUser {
  ForumUser({
      String? firstName, 
      String? lastName, 
      String? imageUrl,}){
    _firstName = firstName;
    _lastName = lastName;
    _imageUrl = imageUrl;
}

  ForumUser.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _imageUrl = json['imageUrl'];
  }
  String? _firstName;
  String? _lastName;
  String? _imageUrl;
ForumUser copyWith({  String? firstName,
  String? lastName,
  String? imageUrl,
}) => ForumUser(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  imageUrl: imageUrl ?? _imageUrl,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['imageUrl'] = _imageUrl;
    return map;
  }

}

class ForumComments {
  ForumComments({
      String? forumCommentId, 
      String? forumId, 
      String? userId, 
      String? comment, 
      String? createdAt,}){
    _forumCommentId = forumCommentId;
    _forumId = forumId;
    _userId = userId;
    _comment = comment;
    _createdAt = createdAt;
}

  ForumComments.fromJson(dynamic json) {
    _forumCommentId = json['forumCommentId'];
    _forumId = json['forumId'];
    _userId = json['userId'];
    _comment = json['comment'];
    _createdAt = json['createdAt'];
  }
  String? _forumCommentId;
  String? _forumId;
  String? _userId;
  String? _comment;
  String? _createdAt;
ForumComments copyWith({  String? forumCommentId,
  String? forumId,
  String? userId,
  String? comment,
  String? createdAt,
}) => ForumComments(  forumCommentId: forumCommentId ?? _forumCommentId,
  forumId: forumId ?? _forumId,
  userId: userId ?? _userId,
  comment: comment ?? _comment,
  createdAt: createdAt ?? _createdAt,
);
  String? get forumCommentId => _forumCommentId;
  String? get forumId => _forumId;
  String? get userId => _userId;
  String? get comment => _comment;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumCommentId'] = _forumCommentId;
    map['forumId'] = _forumId;
    map['userId'] = _userId;
    map['comment'] = _comment;
    map['createdAt'] = _createdAt;
    return map;
  }

}

class ForumLikes {
  ForumLikes({
      String? forumId, 
      String? userId,}){
    _forumId = forumId;
    _userId = userId;
}

  ForumLikes.fromJson(dynamic json) {
    _forumId = json['forumId'];
    _userId = json['userId'];
  }
  String? _forumId;
  String? _userId;
ForumLikes copyWith({  String? forumId,
  String? userId,
}) => ForumLikes(  forumId: forumId ?? _forumId,
  userId: userId ?? _userId,
);
  String? get forumId => _forumId;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumId'] = _forumId;
    map['userId'] = _userId;
    return map;
  }

}