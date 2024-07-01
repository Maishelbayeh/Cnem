import 'package:cenem/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/Api/confirmemailApi.dart';
import 'package:cenem/view/onbonding/condition/condition_dialog.dart';
import 'package:cenem/view/onbonding/confirmemail/coniform_email_page.dart';
import 'package:cenem/view%20model/responsive.dart';

class Forgetpassotp extends StatelessWidget {
  final PinTheme defaultPinTheme;
  final Function(String) onCompleted;
  final String text;
  final String email;
  final bool isSign;

  const Forgetpassotp({
    super.key,
    required this.defaultPinTheme,
    required this.onCompleted,
    required this.text,
    required this.email,
    required this.isSign,
  });

  @override
  Widget build(BuildContext context) {
    String _otpCode = '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/cnem.png'),
                height: 150,
              ),
              Responsive.isLargeMobile(context)
                  ? const SizedBox(height: 40)
                  : const SizedBox(height: 10),
              const Text(
                'أدخــل الـرمـز الـمـرســل إلـى البـريـد الإلــكتـرونــي الـخــاصـ بـــك',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: "Lateef",
                ),
              ),
              const SizedBox(height: 10),
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.black),
                  ),
                ),
                onChanged: (pin) => _otpCode = pin,
                onCompleted: (pin) => _otpCode = pin,
              ),
              CustomButton(
                onTap: () async {
                  bool success = await _submit(_otpCode, email);
                  if (success) {
                    // ignore: use_build_context_synchronously
                    conditionDialog(
                      context,
                      onValue: (_) {},
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Verification failed')),
                    );
                  }
                },
                buttonText: "تـحـقـق",
                width: 150,
                height: 40,
              ),
              const TimerText(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _submit(String otpCode, String email) async {
    try {
      bool success = await confirmEmail(otpCode, email);
      return success;
    } catch (e) {
      print('Error confirming email: $e');
      return false;
    }
  }
}
