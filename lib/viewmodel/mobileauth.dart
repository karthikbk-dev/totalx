import 'package:flutter/material.dart';

class MobileAuth extends StatelessWidget {
  MobileAuth({super.key});

  final TextEditingController phone_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 245,
                child: Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/login_image.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                "Enter Phone Number",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phone_controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hint: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Enter Phone Number",
                          style: TextStyle(color: Color(0xFF888585)),
                        ),
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Color(0xFFFF0000)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Text(
                    "By Continuing, I agree to TotalX’s ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    "Terms and condition",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2873F0).withOpacity(0.5),
                    ),
                  ),
                  Text(
                    "?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Text(
                "privacy policy",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2873F0).withOpacity(0.5),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 50,
                  width: 328,
                  decoration: BoxDecoration(
                    color: Color(0xFF100E09),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: Text(
                      "Get OTP",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
