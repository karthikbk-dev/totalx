import 'package:flutter/material.dart';

class MobileAuth extends StatelessWidget {
  MobileAuth({super.key});

  final TextEditingController phone_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 245,
            child: Center(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("/assets/images/login_image.png"),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Enter Phome Number",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
