import 'package:flutter/cupertino.dart';

class Usermodel {
  final String? name;
  final String? age;
  final String? image;
  final String? phone;

  Usermodel({required this.name, required this.age, this.phone, this.image});
  factory Usermodel.fromjson(Map<String, dynamic> json) {
    return Usermodel(
      name: json["name"],
      age: json["age"],
      phone: json["phone"],
      image: json["image"],
    );
  }

  Map<String, dynamic> tojson() {
    return {'name': name, 'age': age, 'phone': phone, 'image': image};
  }
}
