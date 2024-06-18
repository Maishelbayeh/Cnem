import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/sign_up_textField.dart';
import 'package:cenem/view/home/home.dart';

import 'package:cenem/view/user/main.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const double defaultPadding = 16.0;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    if (controller != null) {
      artboard.addController(controller);
      error = controller.findInput<bool>('Error') as SMITrigger;
      success = controller.findInput<bool>('Check') as SMITrigger;
      reset = controller.findInput<bool>('Reset') as SMITrigger;
    }
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    if (controller != null) {
      artboard.addController(controller);
      confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
    }
  }

  Future<void> singIn(BuildContext context) async {
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (await loginUser(email.text, pass.text, true)) {
      success.fire();
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isShowLoading = false;
      });
      confetti.fire();
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const userMain()),
      );
    } else {
      error.fire();
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isShowLoading = false;
      });
      reset.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingBetweenItems = screenHeight * 0.05;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                              const  HomePage()),
                      );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: paddingBetweenItems),
                  const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   "انشاء حساب جديد",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w500,
                  //     color: Colors.grey[400],
                  //   ),
                  // ),
                  SizedBox(height: paddingBetweenItems),

                  SignUpTextField(
                    icon: Icons.mail,
                    labelText: "البريد الالكتروني",
                    controller: email,
                  ),

                  SizedBox(height: paddingBetweenItems),
                  SignUpTextField(
                    icon: Icons.lock,
                    labelText: "كلمة السر",
                    controller: pass,
                  ),

                  CustomButton(
                    buttonText: 'تسجيل الدخول',
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    onTap: () async {
                      singIn(context);
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "انشاء حساب  ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Text(
                        "لا تملك حساب؟",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
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
