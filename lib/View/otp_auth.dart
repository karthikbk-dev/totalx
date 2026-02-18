import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:totalx_machine_test/View/home.dart';

class OtpAuth extends StatelessWidget {
  const OtpAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                          image: AssetImage("assets/images/register_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter the verification code we just sent to your number +91 *******21",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 20),
                Pinput(
                  length: 6,
                  controller: pinController,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 60,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 60,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "59 sec",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't Get OTP? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Resend",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2873F0),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 328,
                      decoration: BoxDecoration(
                        color: Color(0xFF100E09),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
