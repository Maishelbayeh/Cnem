import 'package:cenem/view/custom%20componant/custom_otp.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class coniformEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OTP(
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      ),
      onCompleted: (String pin) {
        print("Completed: $pin");
      },
      text: 'Enter the OTP sent to your email',
    );
  }
}