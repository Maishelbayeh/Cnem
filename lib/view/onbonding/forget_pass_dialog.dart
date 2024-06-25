import 'package:cenem/view/custom%20componant/custom_otp.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:pinput/pinput.dart';
import 'package:cenem/view model/getx_controllers/courses_controller.dart';

final controller = Get.put(CourseController());

void ForgotPasswordDialog(
    BuildContext context, String Confirmemail, bool isSign,
    {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Responsive(
        desktop: _buildDialog(context, 0.6, 0.7, Confirmemail, isSign),
        largeMobile: _buildDialog(context, 0.8, 0.7, Confirmemail, isSign),
        mobile: _buildDialog(context, 0.8, 0.6, Confirmemail, isSign),
        tablet: _buildDialog(context, 0.8, 0.7, Confirmemail, isSign),
        extraLargeScreen: _buildDialog(context, 0.6, 0.7, Confirmemail, isSign),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(CurvedAnimation(parent: anim, curve: Curves.easeInOut)),
        child: child,
      );
    },
  ).then(onValue);
}

Widget _buildDialog(BuildContext context, double widthFactor,
    double heightFactor, String Confirmemail, bool isSign) {
  final Size screenSize = MediaQuery.of(context).size;
  double dialogWidth = screenSize.width * widthFactor;
  double dialogHeight = screenSize.height * heightFactor;

  return Center(
    child: Container(
      width: dialogWidth,
      height: dialogHeight,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.pink,
            offset: const Offset(-2, 0),
            blurRadius: controller.hovers[0] ? 20 : 10,
          ),
          BoxShadow(
            color: Colors.blue,
            offset: const Offset(2, 0),
            blurRadius: controller.hovers[0] ? 20 : 10,
          ),
        ],
      ),
      child: OTP(
          defaultPinTheme: defaultPinTheme,
          onCompleted: (pin) => debugPrint(pin),
          text: '',
          isSign: isSign,
          email: Confirmemail),
    ),
  );
}

final defaultPinTheme = PinTheme(
  width: 60,
  height: 60,
  textStyle: const TextStyle(fontSize: 22, color: Colors.black),
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 210, 213, 225),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.transparent),
  ),
);
