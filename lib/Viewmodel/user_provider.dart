import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totalx_machine_test/model/usermodel.dart';

class UserProvider extends ChangeNotifier {
  List<Usermodel> userdetails = [];
  XFile? image;
  Uint8List? imageBytes;
  String? base64Image;

  set filtereduserdetails(List<Usermodel> filtereduserdetails) {}

  Future<void> fetchdata() async {
    final storage = await SharedPreferences.getInstance();
    final data = storage.getString("userdata");
    if (data != null) {
      final List decodedata = jsonDecode(data);
      userdetails = decodedata.map((e) => Usermodel.fromjson(e)).toList();
    }
    notifyListeners();
  }

  //...............create user.......................

  Future<void> createUser() async {
    final storage = await SharedPreferences.getInstance();
    final Data = userdetails.map((e) => e.tojson()).toList();
    await storage.setString("userdata", jsonEncode(Data));
  }

  void adduser({String? name, String? age, String? phone}) async {
    try {
      if (name != null && name.isNotEmpty && age != null && age.isNotEmpty
      // phone != null &&
      // phone.isNotEmpty &&
      // base64Image != null
      ) {
        userdetails.add(
          Usermodel(name: name, age: age, phone: phone, image: base64Image),
        );
        await createUser();
        base64Image = null;
        imageBytes = null;
        image = null;
        notifyListeners();
      } else {
        throw "validation error";
      }
    } catch (e) {
      throw "add usser error:$e";
    }
  }

  //.................add image...............

  void addimage(ImageSource source) async {
    try {
      final pickimage = await ImagePicker().pickImage(source: source);
      if (pickimage != null) {
        image = pickimage;
        imageBytes = await pickimage.readAsBytes();
        base64Image = base64Encode(imageBytes!);
        notifyListeners();
        createUser();
      }
    } catch (e) {
      throw "error: $e";
    }
  }

  //...............sort...........

  void sortByAge(bool ascending) {
    userdetails.sort((a, b) {
      final ageA = int.tryParse(a.age ?? '') ?? 0;
      final ageB = int.tryParse(b.age ?? '') ?? 0;

      return ascending ? ageB.compareTo(ageA) : ageA.compareTo(ageB);
    });
  }
}
