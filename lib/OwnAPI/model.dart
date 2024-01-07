class OwnModel {
  bool? success;
  String? message;
  List<Data>? data;

  OwnModel({this.success, this.message, this.data});

  OwnModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? model;
  String? name;
  String? color;
  int? price;
  int? stock;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.model,
    this.name,
    this.color,
    this.price,
    this.stock,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    name = json['name'];
    color = json['color'];
    price = json['price'];
    stock = json['stock'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model'] = model;
    data['name'] = name;
    data['color'] = color;
    data['price'] = price;
    data['stock'] = stock;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
