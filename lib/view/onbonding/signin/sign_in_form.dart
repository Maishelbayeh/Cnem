import 'package:cenem/Api/UserSignUpApi.dart';
import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/onbonding/confirmemail/confirmEmailcode.dart';
import 'package:cenem/view/onbonding/signin/auth_controller.dart';
import 'package:cenem/view/onbonding/resetPass/forget_pass_dialog.dart';
import 'package:cenem/view/onbonding/signup/register_form.dart';
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
  late User user;
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  TextEditingController email = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passSignUp = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
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

  void signIn(BuildContext context) {
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        String result = await loginUser(email.text, pass.text, rememberMe);
        if (result == 'success') {
          success.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();

              Future.delayed(const Duration(seconds: 1), () {
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

          if (result == 'email-not-exist') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('البريد الالكتروني غير موجود')),
            );
          } else if (result == 'incorrect-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('كلمة السر خاطئة')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login failed')),
            );
          }
        }
      },
    );
  }

  final AuthController authController = Get.put(AuthController());

  void nav(String email) {
    print(email);
    Navigator.pop(context);

    ConfirmEmailDialog(
      context,
      email,
      true,
      onValue: (_) {},
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        userName: username.text,
        email: emailSignUp.text,
        phone: phone.text,
        password: passSignUp.text,
        confirmPassword: confirmPassword.text,
      );

      String result = await signUpUser(user);

      if (result == 'success') {
        print(user.email);
        nav(user.email);
      } else if (result == 'email-already-exists') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('البريد الالكتروني موجود بالفعل')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          const SizedBox(
            height: defaultPaddingsign,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: defaultPaddingsign,
                ),
                if (authController.isSignUp.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: SizedBox(
                          width: (widget.emailFieldWidthFactor / 0.9) * 0.44,
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              // if (value!.isEmpty) {
                              //   return "يرجى ادخال كلمة مرور";
                              // }
                              // if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                              //   return "يجب أن تحتوي كلمات المرور على حرف كبير واحد على الأقل.";
                              // }
                              // if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                              //   return "يجب أن تحتوي كلمات المرور على رقم واحد على الأقل.";
                              // }
                              // if (!RegExp(r'^(?=.*?[!@#\$&*~])')
                              //     .hasMatch(value)) {
                              //   return "يجب أن تحتوي كلمات المرور على رمز واحد على الأقل.";
                              // }
                              // if (RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
                              //   return "يجب ألا تحتوي كلمة المرور على أحرف عربية.";
                              // }
                              // return null;
                            },
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "الايميل",
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    "assets/icons/email.svg",
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
                            obscureText: true,
                            validator: (value) {
                              // if (value!.isEmpty) {
                              //   return "يرجى تأكيد كلمة المرور الخاصة بكـ";
                              // }
                              // if (value != passSignUp.text) {
                              //   return "كلمة المرور غير مطابقة.";
                              // }
                              // return null;
                            },
                            controller: confirmPassword,
                            decoration: InputDecoration(
                              hintText: "رقم الهاتف",
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    "assets/icons/iphone.svg",
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
                const SizedBox(
                  height: defaultPaddingsign,
                ),
                if (!authController.isSignUp.value)
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      width: widget.emailFieldWidthFactor,
                      child: TextFormField(
                        validator: (value) {
                          // if (value!.isEmpty) {
                          //   return "";
                          // }
                          // return null;
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
                                "assets/icons/email.svg",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: defaultPaddingsign,
                ),
                if (authController.isSignUp.value)
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 0, bottom: 0),
                  //   child: SizedBox(
                  //     width: widget.emailFieldWidthFactor,
                  //     child: TextFormField(
                  //       validator: (value) {
                  //         // if (value!.isEmpty) {
                  //         //   return "";
                  //         // }
                  //         // return null;
                  //       },
                  //       keyboardType: TextInputType.emailAddress,
                  //       textInputAction: TextInputAction.next,
                  //       controller: emailSignUp,
                  //       decoration: InputDecoration(
                  //         hintText: "البريد الالكتروني",
                  //         prefixIcon: Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: SizedBox(
                  //             width: 30,
                  //             height: 30,
                  //             child: SvgPicture.asset(
                  //               "assets/icons/email.svg",
                  //               fit: BoxFit.contain,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: defaultPaddingsign,
                  ),
                if (!authController.isSignUp.value)
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      width: widget.emailFieldWidthFactor,
                      child: TextFormField(
                        obscureText: true,
                        controller: pass,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                "assets/icons/password.svg",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: defaultPaddingsign,
                ),
                if (authController.isSignUp.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: SizedBox(
                          width: (widget.emailFieldWidthFactor / 0.9) * 0.44,
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              // if (value!.isEmpty) {
                              //   return "يرجى ادخال كلمة مرور";
                              // }
                              // if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                              //   return "يجب أن تحتوي كلمات المرور على حرف كبير واحد على الأقل.";
                              // }
                              // if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                              //   return "يجب أن تحتوي كلمات المرور على رقم واحد على الأقل.";
                              // }
                              // if (!RegExp(r'^(?=.*?[!@#\$&*~])')
                              //     .hasMatch(value)) {
                              //   return "يجب أن تحتوي كلمات المرور على رمز واحد على الأقل.";
                              // }
                              // if (RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
                              //   return "يجب ألا تحتوي كلمة المرور على أحرف عربية.";
                              // }
                              // return null;
                            },
                            controller: passSignUp,
                            decoration: InputDecoration(
                              hintText: 'كلمة المرور',
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    "assets/icons/password.svg",
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
                            obscureText: true,
                            validator: (value) {
                              // if (value!.isEmpty) {
                              //   return "يرجى تأكيد كلمة المرور الخاصة بكـ";
                              // }
                              // if (value != passSignUp.text) {
                              //   return "كلمة المرور غير مطابقة.";
                              // }
                              // return null;
                            },
                            controller: confirmPassword,
                            decoration: InputDecoration(
                              hintText: 'تأكيد كلمة المرور',
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    "assets/icons/password.svg",
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
                const SizedBox(
                  height: defaultPaddingsign,
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
                            email.text,
                            false,
                            onValue: (_) {},
                          );
                        },
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            'نسيت كلمة السر؟',
                            style: TextStyle(
                              color: second,
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
                const SizedBox(
                  height: defaultPaddingsign,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: CustomButton(
                    width: widget.emailFieldWidthFactor,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        authController.isSignUp.value
                            ? nav(email.text)
                            : signIn(context);
                      }
                    },
                    buttonText: authController.isSignUp.value
                        ? 'انشاء حساب'
                        : 'تسجيل الدخول',
                  ),
                ),
                const SizedBox(
                  height: defaultPaddingsign,
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
                        color: second,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
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
