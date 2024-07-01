import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/sign_up_textField.dart';
import 'package:cenem/view/home/home.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/confirmemail/coniform_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const double defaultPaddingsign = 16.0;
TextEditingController email = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController username = TextEditingController();

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  void initState() {
    super.initState();
    print("logg");
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingBetweenItems = screenHeight * 0.05;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AnimatedDescriptionText(
              start: 18, end: 22, text: "انشاء حساب"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ),
          backgroundColor: bgColor,
          elevation: 0,
        ),
        body: Container(
          color: bgColor,
          padding: const EdgeInsets.all(defaultPaddingsign),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      child: TextFormField(
                        cursorColor: second,
                        validator: (value) {
                          // Add your validation logic here
                        },
                        controller: username,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "اسم المستخدم",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                "assets/icons/user.svg",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color:
                                    second), // Color of the border when focused
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: paddingBetweenItems),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      child: TextFormField(
                        cursorColor: second,
                        validator: (value) {
                          // Add your validation logic here
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color:
                                    second), // Color of the border when focused
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: paddingBetweenItems),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      child: TextFormField(
                        cursorColor: second,
                        validator: (value) {
                          // Add your validation logic here
                        },
                        controller: phone,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'رقم الهاتف',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                "assets/icons/iphone.svg",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color:
                                    second), // Color of the border when focused
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: paddingBetweenItems),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      child: TextFormField(
                        cursorColor: second,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يرجى ادخال كلمة مرور";
                          }
                          if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                            return "يجب أن تحتوي كلمات المرور على حرف كبير واحد على الأقل.";
                          }
                          if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                            return "يجب أن تحتوي كلمات المرور على رقم واحد على الأقل.";
                          }
                          if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
                            return "يجب أن تحتوي كلمات المرور على رمز واحد على الأقل.";
                          }
                          if (RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
                            return "يجب ألا تحتوي كلمة المرور على أحرف عربية.";
                          }
                          return null;
                        },
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        controller: pass,
                        decoration: InputDecoration(
                          hintText: "كلمة المرور",
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color:
                                    second), // Color of the border when focused
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultPaddingsign,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      child: TextFormField(
                        cursorColor: second,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يرجى تأكيد كلمة المرور الخاصة بكـ";
                          }
                          if (value != pass.text) {
                            return "كلمة المرور غير مطابقة.";
                          }
                          return null;
                        },
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        controller: confirmPassword,
                        decoration: InputDecoration(
                          hintText: 'تأكيد كلمة المرور',
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: first),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color:
                                    second), // Color of the border when focused
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    buttonText: 'انشاء حساب',
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ConformEmailPage('', email: email.text)),
                      );
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
