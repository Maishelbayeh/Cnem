import 'package:cenem/view/onbonding/signin/sign_in_page_form.dart';
import 'package:cenem/view/onbonding/signup/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:date_field/date_field.dart';

class SecondSignForm extends StatefulWidget {
  const SecondSignForm({
    super.key,
    required this.emailFieldWidthFactor,
    required this.passwordFieldWidthFactor,
    required this.onClose,
  });

  final double emailFieldWidthFactor;
  final double passwordFieldWidthFactor;
  final VoidCallback onClose;

  @override
  State<SecondSignForm> createState() => _SecondSignFormState();
}

class _SecondSignFormState extends State<SecondSignForm> {
  bool _heardFromPerson = false;
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SizedBox(
                      width: (widget.emailFieldWidthFactor / 0.9) * 0.6,
                      child: TextFormField(
                        validator: (value) {
                          return null;

                          // if (value!.isEmpty) {
                          //   return "";
                          // }
                          // return null;
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
                      width: (widget.emailFieldWidthFactor / 0.9) * 0.20,
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
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: (widget.emailFieldWidthFactor / 0.9) * 0.6,
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
                  SizedBox(
                    width: widget.emailFieldWidthFactor /
                        MediaQuery.of(context).size.width *
                        32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SizedBox(
                      width: (widget.emailFieldWidthFactor / 0.9) * 0.2,
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
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Directionality(
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
              if (_heardFromPerson)
                Center(
                  child: SizedBox(
                    width: (widget.emailFieldWidthFactor / 0.9) * 0.82,
                    child: TextFormField(
                      //controller: _referrerPhoneController,
                      decoration: const InputDecoration(
                        labelText: "الرمز ",
                        hintText: "ادخل رمز الشخص ",
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (_heardFromPerson &&
                            (value == null || value.isEmpty)) {
                          return "الرجاء ادخال رمز الشخص";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              const SizedBox(
                height: defaultPadding,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, this.scale = 1, required this.child});

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
