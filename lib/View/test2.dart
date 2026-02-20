// import 'dart:convert';

// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:machine_test_totalx/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserProvider extends ChangeNotifier {
//   List<UserModel> userdetails = [];
//   List<UserModel> filtereduserdetails = [];
//   XFile? images;
//   Uint8List? imageBytes;
//   String? base64Image;

//   //========= fetchdata forn local store =======

//   Future<void> fetchData() async {
//     final localstore = await SharedPreferences.getInstance();
//     final data = localstore.getString('userdata');
//     if (data != null) {
//       final List decodedata = jsonDecode(data);
//       userdetails = decodedata.map((e) => UserModel.fromJson(e)).toList();
//       filtereduserdetails = userdetails;
//     }
//     notifyListeners();
//   }

//   // =========== create/put data to local store ==========

//   Future<void> createData() async {
//     final localstore = await SharedPreferences.getInstance();
//     final data = userdetails.map((e) => e.toJson()).toList();
//     await localstore.setString('userdata', jsonEncode(data));
//   }

//   //============ add user function ========

//   void adduserfun({String? name, String? age, String? phonenumber}) async {
//     try {
//       if (name != null && name.isNotEmpty && age != null && age.isNotEmpty
      
//       // base64Image != null
//       ) {
//         userdetails.add(
//           UserModel(
//             name: name,
//             age: age,
//             phonenumber: phonenumber ?? 'no number',
//             image: base64Image,
//           ),
//         );
//         await createData();
//         base64Image = null;
//         phonenumber=null;
//         imageBytes = null;
//         images = null;
//         notifyListeners();
//       } else {
//         throw "Validation failed: some fields are empty or image missing";
//       }
//     } catch (e) {
//       throw "Add user error: $e";
//     }
//   }

//   //========= search filter by age =======

//   Future<void> filterUserSearch(String data) async {
//     filtereduserdetails = userdetails.where((element) {
//       return element.name.toLowerCase().contains(data.toLowerCase()) ||
//              element.age.contains(data) ||
//              element.phonenumber!.contains(data);
//     }).toList();

//     notifyListeners();
//   }

//   //========= sorting by age =======

//   void sortByAge(bool ascending) {
//     userdetails.sort((a, b) {
//       final ageA = int.tryParse(a.age) ?? 0;
//       final ageB = int.tryParse(b.age) ?? 0;

//       return ascending
//           ? ageB.compareTo(ageA) // Elder first
//           : ageA.compareTo(ageB); // Younger first
//     });

//     notifyListeners();
//   }

//   //========= pick image function =======

//   void pickimagefun(ImageSource source) async {
//     try {
//       final pickimg = await ImagePicker().pickImage(source: source);
//       if (pickimg != null) {
//         images = pickimg;
//         imageBytes = await pickimg.readAsBytes();
//         base64Image = base64Encode(imageBytes!);

//         notifyListeners();
//         createData();
//       }
//       // images==null;
//     } catch (e) {
//       throw 'error: $e';
//     }
//   }
// }