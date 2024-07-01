import 'package:cenem/res/constants.dart';
import 'package:cenem/view/home/home.dart';
import 'package:cenem/view/onbonding/resetPass/forget_pass_dialog.dart';
import 'package:cenem/view/onbonding/resetPass/set_new_pass_dialog.dart';
import 'package:cenem/view/onbonding/resetPass/set_pass_form.dart';
import 'package:cenem/view/onbonding/signup/second_sign_up_dialog.dart';
import 'package:cenem/view/onbonding/signup/second_sign_up_form.dart';
import 'package:cenem/view/onbonding/signup/second_sign_up_page.dart';
import 'package:cenem/view/onbonding/signup/signUp_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:pinput/pinput.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/Api/confirmemailApi.dart';
import 'package:cenem/view/onbonding/condition/condition_dialog.dart';
import 'package:cenem/view/onbonding/confirmemail/coniform_email_page.dart';
import 'package:cenem/view%20model/responsive.dart';

class OTP extends StatelessWidget {
  final PinTheme defaultPinTheme;
  final Function(String) onCompleted;
  final String text;
  final String email;
  final bool isSign;
  final bool reset;

  OTP({
    required this.defaultPinTheme,
    required this.onCompleted,
    required this.text,
    required this.email,
    required this.isSign,
    required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    String _otpCode = '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,
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
                onTap: () {
                  // bool success = await _submit(_otpCode, email);
                  // if (success) {

                  //   if (!reset) {
                  //     conditionDialog(
                  //       context,
                  //       onValue: (_) {},
                  //     );
                  //   } else {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text('Verification failed')),
                  //     );
                  //   }
                  // }

                  if (reset) {
                    if (Responsive.isDesktop(context)) {
                      Navigator.pop(context);
                      setNewPassDialog(
                        context,
                        onValue: (_) {},
                      );
                    }
                    if (Responsive.isExtraLargeScreen(context)) {
                      {
                        Navigator.pop(context);
                        setNewPassDialog(
                          context,
                          onValue: (_) {},
                        );
                      }
                    }
                    if (Responsive.isLargeMobile(context)) {
                      {
                        SetNewPasswordPage();
                      }
                    }
                    if (Responsive.isMobile(context)) {
                      {
                        SetNewPasswordPage();
                      }
                    }
                    if (Responsive.isTablet(context)) {
                      {
                        SetNewPasswordPage();
                      }
                    }
                  } else if (!reset) {
                    if (Responsive.isDesktop(context)) {
                      Navigator.pop(context);
                      SecondSignUP(context, onValue: (_) {});
                    }
                    if (Responsive.isExtraLargeScreen(context)) {
                      {
                        Navigator.pop(context);
                        SecondSignUP(context, onValue: (_) {});
                      }
                    }
                    if (Responsive.isLargeMobile(context)) {
                      {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondSignUpPage()),
                        );
                      }
                    }
                    if (Responsive.isMobile(context)) {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondSignUpPage()),
                        );
                      }
                    }
                    if (Responsive.isTablet(context)) {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondSignUpPage()),
                        );
                      }
                    }
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
