import 'package:cenem/model/member_model.dart';

import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/customtext.dart';

import 'package:cenem/view/custom%20componant/gradiantText.dart';

import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: bgColor,
        child: const Column(
          children: [
            TextWithGradient(
              end: 25,
              start: 20,
              text: "معلومات الحساب",
            ),
          ],
        ),
      ),
    );
  }
}
