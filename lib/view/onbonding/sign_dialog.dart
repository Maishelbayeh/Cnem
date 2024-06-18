import 'package:cenem/view/custom%20componant/subtitle_text.dart';
import 'package:cenem/view/onbonding/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/view/onbonding/sign_in_form.dart';
import '../../view model/getx_controllers/courses_controller.dart';
import 'package:cenem/view%20model/responsive.dart';

final controller = Get.put(CourseController());

void showSignUpDialog(BuildContext context, {required ValueChanged onValue}) {
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
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Obx(
                () => ToggleButtons(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30)),
                  isSelected: [
                    authController.isSignUp.value,
                    !authController.isSignUp.value
                  ],
                  color: Colors.black,
                  onPressed: (int index) {
                    authController.toggleForm();
                  },
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: dialogWidth * 0.15,
                        vertical: 5,
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: dialogWidth * 0.15,
                        vertical: 5,
                      ),
                      child: const Text(
                        'انشاء حساب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: [
                        (kIsWeb && Responsive.isLargeMobile(context)
                            ? Responsive(
                                desktop: ColoredText(
                                    start: 20,
                                    end: 10,
                                    text: authController.isSignUp.value
                                        ? 'انشاء حساب'
                                        : 'تسجيل الدخول',
                                    gradient: true),
                                largeMobile: ColoredText(
                                    start: 30,
                                    end: 25,
                                    text: authController.isSignUp.value
                                        ? 'انشاء حساب'
                                        : 'تسجيل الدخول',
                                    gradient: true),
                                mobile: ColoredText(
                                    start: 25,
                                    end: 20,
                                    text: authController.isSignUp.value
                                        ? 'انشاء حساب'
                                        : 'تسجيل الدخول',
                                    gradient: true),
                                tablet: ColoredText(
                                    start: 40,
                                    end: 30,
                                    text: authController.isSignUp.value
                                        ? 'انشاء حساب'
                                        : 'تسجيل الدخول',
                                    gradient: true),
                              )
                            : ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(colors: [
                                    Colors.pink,
                                    Colors.blue,
                                  ]).createShader(bounds);
                                },
                                child: Responsive(
                                  desktop: ColoredText(
                                      start: 20,
                                      end: 25,
                                      text: authController.isSignUp.value
                                          ? 'انشاء حساب'
                                          : 'تسجيل الدخول',
                                      gradient: false),
                                  largeMobile: ColoredText(
                                      start: 30,
                                      end: 25,
                                      text: authController.isSignUp.value
                                          ? 'انشاء حساب'
                                          : 'تسجيل الدخول',
                                      gradient: false),
                                  mobile: ColoredText(
                                      start: 25,
                                      end: 20,
                                      text: authController.isSignUp.value
                                          ? 'انشاء حساب'
                                          : 'تسجيل الدخول',
                                      gradient: true),
                                  tablet: ColoredText(
                                      start: 20,
                                      end: 25,
                                      text: authController.isSignUp.value
                                          ? 'انشاء حساب'
                                          : 'تسجيل الدخول',
                                      gradient: false),
                                ),
                              )),
                        SignInForm(
                          emailFieldWidthFactor: dialogWidth * 0.9,
                          passwordFieldWidthFactor: dialogWidth * 0.9,
                          onClose: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}