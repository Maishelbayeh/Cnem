<<<<<<< HEAD
import 'package:cenem/model/user_model.dart';
=======
import 'package:cenem/model/member_model.dart';
>>>>>>> origin/gh-pages
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
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const DrawerImage(),
            const Spacer(),
            CustomText(
              text: memberInfo.name,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: defaultPadding / 4,
            ),
            Text(
              memberInfo.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
