import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/sign_up_textField.dart';
import 'package:flutter/material.dart';

const double defaultPadding = 16.0;

class SignInPageForm extends StatelessWidget {
  const SignInPageForm({super.key});

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

                  const SignUpTextField(
                    icon: Icons.mail,
                    labelText: "البريد الالكتروني",
                  ),

                  SizedBox(height: paddingBetweenItems),
                  const SignUpTextField(
                    isPassword: true,
                    icon: Icons.lock,
                    labelText: "كلمة السر",
                  ),

                  CustomButton(
                    buttonText: 'تسجيل الدخول',
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    onTap: () async {
                      await loginUser(
                          "maishelbayeh@icloud.com", "123456mA!", true);
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
