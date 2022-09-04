import 'dart:convert';

/// dataCard : [{"productId":"1b0f2343-0270-4d3d-ba83-2a772e115dc9","name":"Glory","imageUrl":"/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg","cartCount":10,"price":800}]

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  AddToCartModel({
    List<DataCard>? dataCard,
  }) {
    _dataCard = dataCard;
  }

  AddToCartModel.fromJson(dynamic json) {
    if (json['dataCard'] != null) {
      _dataCard = [];
      json['dataCard'].forEach((v) {
        _dataCard?.add(DataCard.fromJson(v));
      });
    }
  }

  List<DataCard>? _dataCard;

  AddToCartModel copyWith({
    List<DataCard>? dataCard,
  }) =>
      AddToCartModel(
        dataCard: dataCard ?? _dataCard,
      );

  List<DataCard>? get dataCard => _dataCard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataCard != null) {
      map['dataCard'] = _dataCard?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

DataCard dataCardFromJson(String str) => DataCard.fromJson(json.decode(str));

String dataCardToJson(DataCard data) => json.encode(data.toJson());

class DataCard {
  DataCard({
    String? productId,
    String? name,
    String? imageUrl,
    int? cartCount,
    int? price,
  }) {
    _productId = productId;
    _name = name;
    _imageUrl = imageUrl;
    _cartCount = cartCount;
    _price = price;
  }

  DataCard.fromJson(dynamic json) {
    _productId = json['productId'];
    _name = json['name'];
    _imageUrl = json['imageUrl'];
    _cartCount = json['cartCount'];
    _price = json['price'];
  }

  String? _productId;
  String? _name;
  String? _imageUrl;
  int? _cartCount;
  int? _price;

  DataCard copyWith({
    String? productId,
    String? name,
    String? imageUrl,
    int? cartCount,
    int? price,
  }) =>
      DataCard(
        productId: productId ?? _productId,
        name: name ?? _name,
        imageUrl: imageUrl ?? _imageUrl,
        cartCount: cartCount ?? _cartCount,
        price: price ?? _price,
      );

  String? get productId => _productId;

  String? get name => _name;

  String? get imageUrl => _imageUrl;

  int? get cartCount => _cartCount;

  int? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['name'] = _name;
    map['imageUrl'] = _imageUrl;
    map['cartCount'] = _cartCount;
    map['price'] = _price;
    return map;
  }
}
