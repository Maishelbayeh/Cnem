
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/sign_up_textField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const double defaultPadding = 16.0;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  Future<void> register() async {
  try {
    print("Starting registration process...");
    
    // Define your email and password
    String email = "user@example.com";
    String password = "String@123";
    
    // Create the request body
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    
    final response = await http.post(
      Uri.parse('https://154.38.171.253/api/Account/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
    } else {
      print('Failed to register. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e, stacktrace) {
    print('An error occurred: $e');
    print('Stacktrace: $stacktrace');
  }
}



  @override
  void initState() {
    super.initState();
    print("logg");
    register();
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
                    "انشاء حساب",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "انشاء حساب جديد",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: paddingBetweenItems),
                  const SignUpTextField(
                    icon: Icons.person_outline,
                    labelText: "اسم المستخدم",
                  ),
                  SizedBox(height: paddingBetweenItems),
                  const SignUpTextField(
                    icon: Icons.mail,
                    labelText: "البريد الالكتروني",
                  ),
                  SizedBox(height: paddingBetweenItems),
                  const SignUpTextField(
                    icon: Icons.phone_iphone,
                    labelText: "رقم الهاتف",
                  ),
                  SizedBox(height: paddingBetweenItems),
                  const SignUpTextField(
                    isPassword: true,
                    icon: Icons.lock,
                    labelText: "كلمة السر",
                  ),
                  SizedBox(height: paddingBetweenItems),
                  const SignUpTextField(
                    isPassword: true,
                    icon: Icons.lock,
                    labelText: "تأكيد كلمة السر",
                  ),

                  CustomButton(
                    buttonText: 'انشاء حساب',
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    onTap: () {
                      // Handle sign up action here
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle navigation to login page here
                        },
                        child: Text(
                          "تسجيل الدخول ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Text(
                        "هل لديك حساب؟",
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
