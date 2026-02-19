import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_test/View/Frame1.dart';
import 'package:totalx_machine_test/View/home.dart';
import 'package:totalx_machine_test/View/mobileauth.dart';
import 'package:totalx_machine_test/View/otp_auth.dart';
import 'package:totalx_machine_test/Viewmodel/user_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider()..fetchdata(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'totalx',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MobileAuth(),
    );
  }
}
