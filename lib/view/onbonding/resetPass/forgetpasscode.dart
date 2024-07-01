import 'package:cenem/res/constants.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/view/custom%20componant/custom_otp.dart';
import 'package:pinput/pinput.dart';
import 'package:cenem/view model/getx_controllers/courses_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String confirmEmail;
  final ValueChanged<String> onValue;
  final bool isSign;

  ForgotPasswordScreen(
      {required this.confirmEmail,
      required this.onValue,
      required this.isSign});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CourseController());
    final Size screenSize = MediaQuery.of(context).size;
    double widthFactor = 0.8;
    double heightFactor = 0.7;

    if (screenSize.width > 1200) {
      widthFactor = 0.6;
      heightFactor = 0.7;
    } else if (screenSize.width > 800) {
      widthFactor = 0.8;
      heightFactor = 0.7;
    } else if (screenSize.width > 600) {
      widthFactor = 0.8;
      heightFactor = 0.6;
    } else {
      widthFactor = 0.8;
      heightFactor = 0.6;
    }

    double dialogWidth = screenSize.width * widthFactor;
    double dialogHeight = screenSize.height * heightFactor;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: bgColor,
          title: const AnimatedDescriptionText(
              start: 18, end: 22, text: "تغيير كلمه السر")),
      body: Center(
        child: Container(
          width: dialogWidth,
          height: dialogHeight,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: first,
                offset: const Offset(-2, 0),
                blurRadius: controller.hovers[0] ? 20 : 10,
              ),
              BoxShadow(
                color: second,
                offset: const Offset(2, 0),
                blurRadius: controller.hovers[0] ? 20 : 10,
              ),
            ],
          ),
          child: OTP(
            defaultPinTheme: defaultPinTheme,
            onCompleted: (pin) {
              debugPrint(pin);
              onValue(pin);
            },
            isSign: isSign,
            text: '',
            email: confirmEmail,
            reset: true,
          ),
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 60,
  height: 60,
  textStyle: const TextStyle(fontSize: 22, color: second),
  decoration: BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: second),
  ),
);
