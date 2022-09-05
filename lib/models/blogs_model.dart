class BlogsModel {
  BlogsModel({
    this.type,
    this.message,
    this.data,
  });

  BlogsModel.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? BlogsData.fromJson(json['data']) : null;
  }

  String? type;
  String? message;
  BlogsData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class BlogsData {
  BlogsData({
    this.plants,
    this.seeds,
    this.tools,
  });

  BlogsData.fromJson(dynamic json) {
    if (json['plants'] != null) {
      plants = [];
      json['plants'].forEach((v) {
        plants?.add(BlogsPlants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = [];
      json['seeds'].forEach((v) {
        seeds?.add(BlogsSeeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = [];
      json['tools'].forEach((v) {
        tools?.add(BlogsTools.fromJson(v));
      });
    }
  }

  List<BlogsPlants>? plants;
  List<BlogsSeeds>? seeds;
  List<BlogsTools>? tools;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (plants != null) {
      map['plants'] = plants?.map((v) => v.toJson()).toList();
    }
    if (seeds != null) {
      map['seeds'] = seeds?.map((v) => v.toJson()).toList();
    }
    if (tools != null) {
      map['tools'] = tools?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BlogsTools {
  BlogsTools({
    this.toolId,
    this.name,
    this.description,
    this.imageUrl,
  });

  BlogsTools.fromJson(dynamic json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['toolId'] = toolId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }
}

class BlogsSeeds {
  BlogsSeeds({
    this.seedId,
    this.name,
    this.description,
    this.imageUrl,
  });

  BlogsSeeds.fromJson(dynamic json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seedId'] = seedId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }
}

class BlogsPlants {
  BlogsPlants({
    this.plantId,
    this.name,
    this.description,
    this.imageUrl,
    this.waterCapacity,
    this.sunLight,
    this.temperature,
  });

  BlogsPlants.fromJson(dynamic json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  num? waterCapacity;
  num? sunLight;
  num? temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plantId'] = plantId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['waterCapacity'] = waterCapacity;
    map['sunLight'] = sunLight;
    map['temperature'] = temperature;
    return map;
  }
}
