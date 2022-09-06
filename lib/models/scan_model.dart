import 'dart:convert';
/// type : "Success"
/// message : "Reciept fetched successfully and points already claimed"
/// data : {"recieptId":"05dbd7fe-31d4-451e-872f-31bead144151","userId":"947059c7-8cd3-4a6a-89a1-0af5d99bfd2c","totalPrice":6250,"claimedPoints":true,"createdAt":"2022-09-06T10:48:57.503Z","Products":[{"recieptId":"05dbd7fe-31d4-451e-872f-31bead144151","userId":"947059c7-8cd3-4a6a-89a1-0af5d99bfd2c","quantity":4,"productId":"42edbb62-b102-451b-aa6a-2171ffbf7c62"}]}

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());
class ScanModel {
  ScanModel({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  ScanModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
ScanModel copyWith({  String? type,
  String? message,
  Data? data,
}) => ScanModel(  type: type ?? _type,
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

/// recieptId : "05dbd7fe-31d4-451e-872f-31bead144151"
/// userId : "947059c7-8cd3-4a6a-89a1-0af5d99bfd2c"
/// totalPrice : 6250
/// claimedPoints : true
/// createdAt : "2022-09-06T10:48:57.503Z"
/// Products : [{"recieptId":"05dbd7fe-31d4-451e-872f-31bead144151","userId":"947059c7-8cd3-4a6a-89a1-0af5d99bfd2c","quantity":4,"productId":"42edbb62-b102-451b-aa6a-2171ffbf7c62"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? recieptId, 
      String? userId, 
      int? totalPrice, 
      bool? claimedPoints, 
      String? createdAt, 
      List<Products>? products,}){
    _recieptId = recieptId;
    _userId = userId;
    _totalPrice = totalPrice;
    _claimedPoints = claimedPoints;
    _createdAt = createdAt;
    _products = products;
}

  Data.fromJson(dynamic json) {
    _recieptId = json['recieptId'];
    _userId = json['userId'];
    _totalPrice = json['totalPrice'];
    _claimedPoints = json['claimedPoints'];
    _createdAt = json['createdAt'];
    if (json['Products'] != null) {
      _products = [];
      json['Products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _recieptId;
  String? _userId;
  int? _totalPrice;
  bool? _claimedPoints;
  String? _createdAt;
  List<Products>? _products;
Data copyWith({  String? recieptId,
  String? userId,
  int? totalPrice,
  bool? claimedPoints,
  String? createdAt,
  List<Products>? products,
}) => Data(  recieptId: recieptId ?? _recieptId,
  userId: userId ?? _userId,
  totalPrice: totalPrice ?? _totalPrice,
  claimedPoints: claimedPoints ?? _claimedPoints,
  createdAt: createdAt ?? _createdAt,
  products: products ?? _products,
);
  String? get recieptId => _recieptId;
  String? get userId => _userId;
  int? get totalPrice => _totalPrice;
  bool? get claimedPoints => _claimedPoints;
  String? get createdAt => _createdAt;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recieptId'] = _recieptId;
    map['userId'] = _userId;
    map['totalPrice'] = _totalPrice;
    map['claimedPoints'] = _claimedPoints;
    map['createdAt'] = _createdAt;
    if (_products != null) {
      map['Products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// recieptId : "05dbd7fe-31d4-451e-872f-31bead144151"
/// userId : "947059c7-8cd3-4a6a-89a1-0af5d99bfd2c"
/// quantity : 4
/// productId : "42edbb62-b102-451b-aa6a-2171ffbf7c62"

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      String? recieptId, 
      String? userId, 
      int? quantity, 
      String? productId,}){
    _recieptId = recieptId;
    _userId = userId;
    _quantity = quantity;
    _productId = productId;
}

  Products.fromJson(dynamic json) {
    _recieptId = json['recieptId'];
    _userId = json['userId'];
    _quantity = json['quantity'];
    _productId = json['productId'];
  }
  String? _recieptId;
  String? _userId;
  int? _quantity;
  String? _productId;
Products copyWith({  String? recieptId,
  String? userId,
  int? quantity,
  String? productId,
}) => Products(  recieptId: recieptId ?? _recieptId,
  userId: userId ?? _userId,
  quantity: quantity ?? _quantity,
  productId: productId ?? _productId,
);
  String? get recieptId => _recieptId;
  String? get userId => _userId;
  int? get quantity => _quantity;
  String? get productId => _productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recieptId'] = _recieptId;
    map['userId'] = _userId;
    map['quantity'] = _quantity;
    map['productId'] = _productId;
    return map;
  }

}