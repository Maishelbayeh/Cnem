import 'package:cenem/view/custom%20componant/custom_otp.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

String pin = '';

class ConformEmailPage extends StatelessWidget {
  final String email;

  // Constructor to accept the email parameter
  ConformEmailPage(String text, {required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Email'),
      ),
      body: Center(
        child: OTP(
          email: email,
          isSign: true,
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
          ),
          onCompleted: (pin) {
            print("Completed: $pin");
            if (pin == '1234') {
              // Handle the successful OTP verification
              print('OTP is correct');
              // You can navigate to another page or perform another action
            } else {
              // Handle the incorrect OTP case
              print('OTP is incorrect');
              // Show an error message or take another action
            }
          },
          text: 'Enter the OTP sent to your email',
        ),
      ),
    );
  }
}
