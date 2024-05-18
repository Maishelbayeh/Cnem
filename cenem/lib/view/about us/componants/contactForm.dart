import 'package:cenem/view/about%20us/componants/customTextField.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            text: 'اسم الكامل',
            start: 1.0,
            end: 2.0,
          ),
          SizedBox(height: 16.0),
          CustomTextField(
            text: 'الايميل',
            start: 1.0,
            end: 2.0,
          ),
          SizedBox(height: 16.0),
          CustomTextField(
            text: 'الموضوع',
            start: 1.0,
            end: 2.0,
          ),
        ],
      ),
    );
  }
}
