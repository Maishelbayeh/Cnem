import 'package:cenem/view/custom%20componant/customtext.dart';
import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart';
import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: bgColor,
        child: const Column(
          children: [
            Spacer(
              flex: 2,
            ),
            DrawerImage(),
            Spacer(),
            CustomText(
              text: 'طلال العقاد',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: defaultPadding / 4,
            ),
            Text(
              'المدير العام \nصاحب فكره الشبكه ',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
