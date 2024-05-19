import 'package:cenem/view/custom%20componant/subtitle_text.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../view model/getx_controllers/courses_controller.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';

import 'sign_in_form.dart';

// Assuming you have defined the Responsive widget in a separate file
final controller = Get.put(CourseController());
void showCustomDialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Responsive(
        desktop: _buildDialog(context, 0.6, 0.7),
        largeMobile: _buildDialog(context, 0.8, 0.7),
        mobile: _buildDialog(context, 0.4, 0.6),
        tablet: _buildDialog(context, 0.8, 0.7),
        extraLargeScreen: _buildDialog(context, 0.6, 0.7),
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
          ]),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  (kIsWeb && Responsive.isLargeMobile(context)
                      ? const Responsive(
                          desktop: ColoredText(
                              start: 30,
                              end: 40,
                              text: 'Sign In ',
                              gradient: true),
                          largeMobile: ColoredText(
                              start: 30,
                              end: 25,
                              text: 'Sign In ',
                              gradient: true),
                          mobile: ColoredText(
                              start: 25,
                              end: 20,
                              text: 'Sign In ',
                              gradient: true),
                          tablet: ColoredText(
                              start: 40,
                              end: 30,
                              text: 'Sign In ',
                              gradient: true),
                        )
                      : ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(colors: [
                              Colors.pink,
                              Colors.blue,
                            ]).createShader(bounds);
                          },
                          child: const Responsive(
                            desktop: ColoredText(
                                start: 30,
                                end: 40,
                                text: 'Sign In ',
                                gradient: false),
                            largeMobile: ColoredText(
                                start: 30,
                                end: 25,
                                text: 'Sign In ',
                                gradient: false),
                            mobile: ColoredText(
                                start: 25,
                                end: 20,
                                text: 'Sign In ',
                                gradient: true),
                            tablet: ColoredText(
                                start: 40,
                                end: 30,
                                text: 'Sign In ',
                                gradient: false),
                          ),
                        )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),

                  Responsive(
                      desktop: SignInForm(
                          emailFieldWidthFactor: 0.5 * dialogWidth,
                          passwordFieldWidthFactor: 0.5 * dialogWidth),
                      largeMobile: SignInForm(
                          emailFieldWidthFactor: 0.8 * dialogWidth,
                          passwordFieldWidthFactor: 0.8 * dialogWidth),
                      mobile: SignInForm(
                          emailFieldWidthFactor: 0.8 * dialogWidth,
                          passwordFieldWidthFactor: 0.8 * dialogWidth),
                      tablet: SignInForm(
                          emailFieldWidthFactor: 0.5 * dialogWidth,
                          passwordFieldWidthFactor: 0.5 * dialogWidth),
                      extraLargeScreen: SignInForm(
                          emailFieldWidthFactor: 0.5 * dialogWidth,
                          passwordFieldWidthFactor: 0.5 * dialogWidth)),
                  // Pass width factors to SignInForm
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
