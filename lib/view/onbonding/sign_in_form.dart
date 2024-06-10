import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/home/home.dart';
import 'package:cenem/view/onbonding/auth_controller.dart';
import 'package:cenem/view/onbonding/forget_pass_dialog.dart';
import 'package:cenem/view/user/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
    required this.emailFieldWidthFactor,
    required this.passwordFieldWidthFactor,
    required this.onClose,
  }) : super(key: key);

  final double emailFieldWidthFactor;
  final double passwordFieldWidthFactor;
  final VoidCallback onClose;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void singIn(BuildContext context) {
    // confetti.fire();
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        if (await loginUser(email.text, pass.text, true)) {
          success.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              // Navigate & hide confetti
              Future.delayed(const Duration(seconds: 1), () {
                // Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const userMain()),
                );
              });
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              reset.fire();
            },
          );
        }
      },
    );
  }

  final AuthController authController = Get.put(AuthController());

  void nav() {
    widget.onClose();

    ForgotPasswordDialog(
      context,
      onValue: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (authController.isSignUp.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 0),
                          child: SizedBox(
                            width: (widget.emailFieldWidthFactor / 0.9) * 0.44,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "اسم المستخدم",
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: SvgPicture.asset(
                                      "icons/user.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widget.emailFieldWidthFactor /
                              MediaQuery.of(context).size.width *
                              32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 0),
                          child: SizedBox(
                            width: (widget.emailFieldWidthFactor / 0.9) * 0.44,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'رقم الهاتف',
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: SvgPicture.asset(
                                      "icons/iphone.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!authController.isSignUp.value)
                    const Text(
                      "البريد الالكتروني",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      width: widget.emailFieldWidthFactor,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "البريد الالكتروني",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                "icons/email.svg",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!authController.isSignUp.value)
                    const Text(
                      "كلمة السر",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: SizedBox(
                      width: widget.passwordFieldWidthFactor,
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password.";
                          }
                          if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                            return "Passwords must have at least one uppercase letter.";
                          }
                          if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                            return "Passwords must have at least one digit.";
                          }
                          if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
                            return "Passwords must have at least one non-alphanumeric character.";
                          }
                          return null;
                        },
                        controller: pass,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                "icons/password.svg",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!authController.isSignUp.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.onClose();

                            ForgotPasswordDialog(
                              context,
                              onValue: (_) {},
                            );
                          },
                          child: const MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              'نسيت كلمة السر؟',
                              style: TextStyle(
                                color: Color.fromARGB(255, 7, 24, 217),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'تذكرني',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 10),
                    child: CustomButton(
                      width: widget.emailFieldWidthFactor,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          authController.isSignUp.value
                              ? nav()
                              : singIn(context);
                        }
                      },
                      buttonText: authController.isSignUp.value
                          ? 'انشاء حساب'
                          : 'تسجيل الدخول',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            authController.isSignUp.value =
                                !authController.isSignUp.value;
                          },
                          child: Text(
                            authController.isSignUp.value
                                ? "تسجيل الدخول "
                                : 'انشاء حساب',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        authController.isSignUp.value
                            ? "هل لديك حساب؟  "
                            : "لا تملك حساب؟   ",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isShowLoading
              ? CustomPositioned(
                  child: RiveAnimation.asset(
                    'assets/RiveAssets/check.riv',
                    fit: BoxFit.cover,
                    onInit: _onCheckRiveInit,
                  ),
                )
              : const SizedBox(),
          isShowConfetti
              ? CustomPositioned(
                  scale: 6,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: _onConfettiRiveInit,
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({Key? key, this.scale = 1, required this.child})
      : super(key: key);

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
