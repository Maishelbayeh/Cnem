import 'package:cenem/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';
import 'package:intl/intl.dart'; // Import the intl package

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(memberInfo.date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding / 2,
        ),
        AreaInfoText(title: 'تاريخ الانضمام', text: formattedDate),
        AreaInfoText(
            title: 'رقم الهاتف', text: memberInfo.phonenumber.toString()),
        AreaInfoText(title: 'الايميل', text: memberInfo.email.toString()),
        // AreaInfoText(title: 'LinkedIn', text: '@hamad-anwar'),
        // AreaInfoText(title: 'Github', text: '@hamad-anwar'),
        const SizedBox(
          height: defaultPadding,
        ),
        Text(
          'Skills',
          style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
