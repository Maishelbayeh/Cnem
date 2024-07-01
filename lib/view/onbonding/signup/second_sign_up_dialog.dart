import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/condition/condition_dialog.dart';
import 'package:cenem/view/onbonding/signin/auth_controller.dart';

import 'package:cenem/view/onbonding/signup/second_sign_up_form.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/view model/getx_controllers/courses_controller.dart';
import 'package:cenem/view%20model/responsive.dart';

final controller = Get.put(CourseController());

void SecondSignUP(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Responsive(
        desktop: _buildDialog(context, 0.6, 0.8),
        largeMobile: _buildDialog(context, 0.8, 0.7),
        mobile: _buildDialog(context, 0.8, 0.6),
        tablet: _buildDialog(context, 0.8, 0.7),
        extraLargeScreen: _buildDialog(context, 0.6, 0.8),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
  ).then(onValue);
}

Widget _buildDialog(
    BuildContext context, double widthFactor, double heightFactor) {
  final Size screenSize = MediaQuery.of(context).size;

  double dialogWidth = screenSize.width * widthFactor;
  double dialogHeight = (screenSize.height * (heightFactor)) + 20;

  return Center(
    child: DialogContent(dialogWidth: dialogWidth, dialogHeight: dialogHeight),
  );
}

class DialogContent extends StatelessWidget {
  final double dialogWidth;
  final double dialogHeight;

  const DialogContent(
      {super.key, required this.dialogWidth, required this.dialogHeight});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return SingleChildScrollView(
      child: Container(
        color: bgColor,
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
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            centerTitle: true,
            title: const AnimatedDescriptionText(
                start: 18, end: 22, text: "تسجيل كعضو في الشبكة"),
            backgroundColor: bgColor,
            elevation: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/cnem.png'),
                    height: 100,
                  ),
                  SecondSignForm(
                    emailFieldWidthFactor: dialogWidth * 0.9,
                    passwordFieldWidthFactor: dialogWidth * 0.9,
                    onClose: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    onTap: () {
                      conditionDialog(context, onValue: (_) {});
                    },
                    buttonText: "التـالـي",
                    height: 40,
                    width: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}