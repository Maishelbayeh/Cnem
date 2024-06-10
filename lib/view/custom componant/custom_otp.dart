import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/onbonding/condition_dialog.dart';
import 'package:cenem/view/onbonding/term_condition_form.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/view/custom%20componant/custom_text.dart';

class OTP extends StatelessWidget {
  final PinTheme defaultPinTheme;
  final ValueChanged<String> onCompleted;
  final String text;

  OTP({
    required this.defaultPinTheme,
    required this.onCompleted,
    required this.text,
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
              Responsive.isLargeMobile(context)?
              SizedBox(
                height: 40,
              ):
              SizedBox(
                height: 10,
              ),
              const Text(
                'أدخــل الـرمـز الـمـرســل إلـى البـريـد الإلــكتـرونــي الـخــاصـ بـــك',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: "Lateef",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.black),
                  ),
                ),
                
                onCompleted: (pin) => debugPrint(_otpCode = pin),
              ),
              
              CustomButton(onTap: () { 
            //     Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
            // );
            conditionDialog(
                              context,
                              onValue: (_) {},
                            );
            }, buttonText: "تـحـقـق", width: 150, height: 40),
              const TimerText(),
            ],
          ),
        ),
      ),
    );
  }
}
