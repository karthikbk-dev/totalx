import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totalx_machine_test/model/usermodel.dart';

class UserProvider extends ChangeNotifier {
  List<Usermodel> _userdetails = [];
  List<Usermodel> _filtereduserdetails = [];

  List<Usermodel> get userdetails => _userdetails;
  List<Usermodel> get filtereduserdetails => _filtereduserdetails;

  Uint8List? imageBytes;
  String? base64Image;

  // ------------------ FETCH DATA ------------------

  Future<void> fetchdata() async {
    final storage = await SharedPreferences.getInstance();
    final data = storage.getString("userdata");

    if (data != null) {
      final List decodedata = jsonDecode(data);
      _userdetails = decodedata.map((e) => Usermodel.fromjson(e)).toList();
    } else {
      _userdetails = [];
    }

    _filtereduserdetails = List.from(_userdetails);

    notifyListeners();
  }

  // ------------------ SAVE TO STORAGE ------------------

  Future<void> _saveToStorage() async {
    final storage = await SharedPreferences.getInstance();
    final data = _userdetails.map((e) => e.tojson()).toList();
    await storage.setString("userdata", jsonEncode(data));
  }

  // ------------------ ADD USER ------------------

  Future<void> adduser({
    required String name,
    required String age,
    String? phone,
  }) async {
    if (name.isEmpty || age.isEmpty || base64Image == null) {
      throw Exception("Validation error");
    }

    final newUser = Usermodel(
      name: name,
      age: age,
      phone: phone,
      image: base64Image,
    );

    _userdetails.add(newUser);

    await _saveToStorage();

    base64Image = null;
    imageBytes = null;

    _filtereduserdetails = List.from(_userdetails);

    notifyListeners();
  }

  // ------------------ ADD IMAGE ------------------

  Future<void> addimage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      imageBytes = await pickedImage.readAsBytes();
      base64Image = base64Encode(imageBytes!);

      notifyListeners();
    }
  }

  // ------------------ SORT BY AGE ------------------

  void sortByAge({required bool ascending}) {
    _filtereduserdetails.sort((a, b) {
      final ageA = int.tryParse(a.age ?? '') ?? 0;
      final ageB = int.tryParse(b.age ?? '') ?? 0;

      return ascending
          ? ageA.compareTo(ageB) // Younger → Elder
          : ageB.compareTo(ageA); // Elder → Younger
    });

    notifyListeners();
  }

  // ------------------ RESET FILTER ------------------

  void resetFilter() {
    _filtereduserdetails = List.from(_userdetails);
    notifyListeners();
  }

  // ------------------ SEARCH BY NAME ------------------

  void searchUser(String query) {
    if (query.isEmpty) {
      _filtereduserdetails = List.from(_userdetails);
    } else {
      _filtereduserdetails = _userdetails
          .where(
            (user) => user.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    notifyListeners();
  }

  // ------------------ DELETE USER (Optional Bonus) ------------------

  Future<void> deleteUser(int index) async {
    _userdetails.removeAt(index);
    _filtereduserdetails = List.from(_userdetails);
    await _saveToStorage();
    notifyListeners();
  }
}
