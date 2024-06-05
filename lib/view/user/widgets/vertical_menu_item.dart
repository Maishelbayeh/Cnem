import 'package:cenem/res/constants.dart';

import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';

class VertticalMenuItem extends StatelessWidget {
  final TextWithGradient itemName;

  const VertticalMenuItem({Key? key, required this.itemName}) : super(key: key);

  @override
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
