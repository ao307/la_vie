import 'dart:convert';

/// type : "Success"
/// message : "Product Fetched Successfully"
/// data : [{"productId":"1b0f2343-0270-4d3d-ba83-2a772e115dc9","name":"Glory","description":"Arizona achieved statehood","imageUrl":"/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg","type":"PLANT","price":800,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxProductSeeds","description":"super rich in fiber","imageUrl":""},"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":{"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""}}]

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    String? type,
    String? message,
    List<ProductData>? data,
  }) {
    _type = type;
    _message = message;
    _data = data;
  }

  ProductsModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductData.fromJson(v));
      });
    }
  }

  String? _type;
  String? _message;
  List<ProductData>? _data;

  ProductsModel copyWith({
    String? type,
    String? message,
    List<ProductData>? data,
  }) =>
      ProductsModel(
        type: type ?? _type,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get type => _type;

  String? get message => _message;

  List<ProductData>? get data => _data;

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

/// productId : "1b0f2343-0270-4d3d-ba83-2a772e115dc9"
/// name : "Glory"
/// description : "Arizona achieved statehood"
/// imageUrl : "/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg"
/// type : "PLANT"
/// price : 800
/// available : true
/// seed : {"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxProductSeeds","description":"super rich in fiber","imageUrl":""}
/// plant : {"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512}
/// tool : {"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""}

ProductData dataFromJson(String str) => ProductData.fromJson(json.decode(str));

String dataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    String? productId,
    String? name,
    String? description,
    String? imageUrl,
    String? type,
    int? price,
    bool? available,
    ProductSeed? seed,
    ProductPlant? plant,
    ProductTool? tool,
  }) {
    _productId = productId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _type = type;
    _price = price;
    _available = available;
    _seed = seed;
    _plant = plant;
    _tool = tool;
  }

  ProductData.fromJson(dynamic json) {
    _productId = json['productId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _type = json['type'];
    _price = json['price'];
    _available = json['available'];
    _seed = json['seed'] != null ? ProductSeed.fromJson(json['seed']) : null;
    _plant =
        json['plant'] != null ? ProductPlant.fromJson(json['plant']) : null;
    _tool = json['tool'] != null ? ProductTool.fromJson(json['tool']) : null;
  }

  String? _productId;
  String? _name;
  String? _description;
  String? _imageUrl;
  String? _type;
  int? _price;
  bool? _available;
  ProductSeed? _seed;
  ProductPlant? _plant;
  ProductTool? _tool;

  ProductData copyWith({
    String? productId,
    String? name,
    String? description,
    String? imageUrl,
    String? type,
    int? price,
    bool? available,
    ProductSeed? seed,
    ProductPlant? plant,
    ProductTool? tool,
  }) =>
      ProductData(
        productId: productId ?? _productId,
        name: name ?? _name,
        description: description ?? _description,
        imageUrl: imageUrl ?? _imageUrl,
        type: type ?? _type,
        price: price ?? _price,
        available: available ?? _available,
        seed: seed ?? _seed,
        plant: plant ?? _plant,
        tool: tool ?? _tool,
      );

  String? get productId => _productId;

  String? get name => _name;

  String? get description => _description;

  String? get imageUrl => _imageUrl;

  String? get type => _type;

  int? get price => _price;

  bool? get available => _available;

  ProductSeed? get seed => _seed;

  ProductPlant? get plant => _plant;

  ProductTool? get tool => _tool;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['type'] = _type;
    map['price'] = _price;
    map['available'] = _available;
    if (_seed != null) {
      map['seed'] = _seed?.toJson();
    }
    if (_plant != null) {
      map['plant'] = _plant?.toJson();
    }
    if (_tool != null) {
      map['tool'] = _tool?.toJson();
    }
    return map;
  }
}

/// toolId : "12879d6e-106a-47bb-8a91-bf4797c604dc"
/// name : "Axe"
/// description : "sharpaxe"
/// imageUrl : ""

ProductTool toolFromJson(String str) => ProductTool.fromJson(json.decode(str));

String toolToJson(ProductTool data) => json.encode(data.toJson());

class ProductTool {
  ProductTool({
    String? toolId,
    String? name,
    String? description,
    String? imageUrl,
  }) {
    _toolId = toolId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
  }

  ProductTool.fromJson(dynamic json) {
    _toolId = json['toolId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  String? _toolId;
  String? _name;
  String? _description;
  String? _imageUrl;

  ProductTool copyWith({
    String? toolId,
    String? name,
    String? description,
    String? imageUrl,
  }) =>
      ProductTool(
        toolId: toolId ?? _toolId,
        name: name ?? _name,
        description: description ?? _description,
        imageUrl: imageUrl ?? _imageUrl,
      );

  String? get toolId => _toolId;

  String? get name => _name;

  String? get description => _description;

  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['toolId'] = _toolId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    return map;
  }
}

/// plantId : "f985a224-ee41-411e-9327-dfb9822544ab"
/// name : "Cherokee Rose"
/// description : "This spring bloomer"
/// imageUrl : "/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png"
/// waterCapacity : 415
/// sunLight : 325
/// temperature : 512

ProductPlant plantFromJson(String str) =>
    ProductPlant.fromJson(json.decode(str));

String plantToJson(ProductPlant data) => json.encode(data.toJson());

class ProductPlant {
  ProductPlant({
    String? plantId,
    String? name,
    String? description,
    String? imageUrl,
    int? waterCapacity,
    int? sunLight,
    int? temperature,
  }) {
    _plantId = plantId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _waterCapacity = waterCapacity;
    _sunLight = sunLight;
    _temperature = temperature;
  }

  ProductPlant.fromJson(dynamic json) {
    _plantId = json['plantId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _waterCapacity = json['waterCapacity'];
    _sunLight = json['sunLight'];
    _temperature = json['temperature'];
  }

  String? _plantId;
  String? _name;
  String? _description;
  String? _imageUrl;
  int? _waterCapacity;
  int? _sunLight;
  int? _temperature;

  ProductPlant copyWith({
    String? plantId,
    String? name,
    String? description,
    String? imageUrl,
    int? waterCapacity,
    int? sunLight,
    int? temperature,
  }) =>
      ProductPlant(
        plantId: plantId ?? _plantId,
        name: name ?? _name,
        description: description ?? _description,
        imageUrl: imageUrl ?? _imageUrl,
        waterCapacity: waterCapacity ?? _waterCapacity,
        sunLight: sunLight ?? _sunLight,
        temperature: temperature ?? _temperature,
      );

  String? get plantId => _plantId;

  String? get name => _name;

  String? get description => _description;

  String? get imageUrl => _imageUrl;

  int? get waterCapacity => _waterCapacity;

  int? get sunLight => _sunLight;

  int? get temperature => _temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plantId'] = _plantId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['waterCapacity'] = _waterCapacity;
    map['sunLight'] = _sunLight;
    map['temperature'] = _temperature;
    return map;
  }
}

/// seedId : "0ba0060a-a353-43dd-87d5-15a4523dcf0c"
/// name : "FlaxProductSeeds"
/// description : "super rich in fiber"
/// imageUrl : ""

ProductSeed seedFromJson(String str) => ProductSeed.fromJson(json.decode(str));

String seedToJson(ProductSeed data) => json.encode(data.toJson());

class ProductSeed {
  ProductSeed({
    String? seedId,
    String? name,
    String? description,
    String? imageUrl,
  }) {
    _seedId = seedId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
  }

  ProductSeed.fromJson(dynamic json) {
    _seedId = json['seedId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  String? _seedId;
  String? _name;
  String? _description;
  String? _imageUrl;

  ProductSeed copyWith({
    String? seedId,
    String? name,
    String? description,
    String? imageUrl,
  }) =>
      ProductSeed(
        seedId: seedId ?? _seedId,
        name: name ?? _name,
        description: description ?? _description,
        imageUrl: imageUrl ?? _imageUrl,
      );

  String? get seedId => _seedId;

  String? get name => _name;

  String? get description => _description;

  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seedId'] = _seedId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    return map;
  }
}
