import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/view/user/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
Future<void> signIn(BuildContext context) async {
  setState(() {
    isShowConfetti = true;
    isShowLoading = true;
  });

  await Future.delayed(const Duration(seconds: 1));

  String result = await loginUser(email.text, pass.text, true);

  if (result == 'success') {
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
}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
