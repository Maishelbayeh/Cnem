import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/home/home.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/condition/condition_dialog.dart';
import 'package:cenem/view/onbonding/confirmemail/coniform_email_page.dart';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double defaultPadd = 16.0;
TextEditingController email = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController username = TextEditingController();

class SecondSignUpPage extends StatefulWidget {
  const SecondSignUpPage({super.key});

  @override
  _SecondSignUpPageState createState() => _SecondSignUpPageState();
}

class _SecondSignUpPageState extends State<SecondSignUpPage> {
  DateTime? selectedDate;
  bool _heardFromPerson = false;
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
              start: 18, end: 22, text: "تسجيل كعضو في الشبكة"),
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
              color: second,
              size: 30,
            ),
          ),
          backgroundColor: bgColor,
          elevation: 0,
        ),
        body: Container(
          color: bgColor, // Set your desired background color here
          child: Padding(
            padding: const EdgeInsets.all(defaultPadd),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/cnem.png'),
                      height: 120,
                    ),
                    const SizedBox(
                      height: defaultPadd,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      child: SizedBox(
                        child: TextFormField(
                          cursorColor: second,
                          validator: (value) {
                            return null;

                            // Add your validation logic here
                          },
                          controller: username,
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
                                  "assets/icons/user.svg",
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
                    SizedBox(height: paddingBetweenItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            width: screenHeight * 0.3,
                            child: DropdownButtonFormField<String>(
                              hint: const Text("gender"),
                              borderRadius: BorderRadius.circular(15),
                              items: ['ذكر', 'أنثى']
                                  .map((label) => DropdownMenuItem(
                                        value: label,
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(label)),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your gender';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
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
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField<String>(
                              hint: const Text('الجنسية'),
                              borderRadius: BorderRadius.circular(15),
                              items: ['اردنية', 'فلسطينية']
                                  .map((label) => DropdownMenuItem(
                                        value: label,
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(label)),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your gender';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
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
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadd,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      child: SizedBox(
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            labelText: 'Date of Birth',
                            hintText: 'Enter your date of birth',
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          validator: (DateTime? value) {
                            if (value == null) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                          onChanged: (DateTime? value) {
                            selectedDate = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: paddingBetweenItems),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      child: SizedBox(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: SwitchListTile(
                            title: const Text(
                              'هل سمعت عن الشبكة من شخص فيها ؟',
                              textAlign: TextAlign.right,
                            ),
                            value: _heardFromPerson,
                            onChanged: (bool value) {
                              setState(() {
                                _heardFromPerson = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadd,
                    ),
                    if (_heardFromPerson)
                      Center(
                        child: SizedBox(
                          child: TextFormField(
                            //controller: _referrerPhoneController,

                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (_heardFromPerson &&
                                  (value == null || value.isEmpty)) {
                                return "الرجاء ادخال رمز الشخص";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "رمز الشخص",
                              hintText: "قم بادخال رمز الشخص",
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
                    const SizedBox(
                      height: defaultPadd,
                    ),
                    CustomButton(
                      buttonText: 'التالي',
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      onTap: () {
                        conditionDialog(
                          context,
                          onValue: (_) {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
