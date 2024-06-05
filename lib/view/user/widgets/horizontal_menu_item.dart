import 'package:cenem/res/constants.dart';

import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';

class HorizontalMenuItem extends StatelessWidget {
  final TextWithGradient itemName;
  final Function()? onTap;
  const HorizontalMenuItem({Key? key, required this.itemName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: bgColor,
        child: const Row(
          children: [
            TextWithGradient(
              end: 25,
              start: 20,
              text: "ملومات الحساب",
            ),
          ],
        ),
      ),
    );
  }
}
