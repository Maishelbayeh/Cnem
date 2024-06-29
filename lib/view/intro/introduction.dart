import 'package:flutter/material.dart';
import 'package:cenem/view/custom%20componant/advertisement.dart';
import 'package:cenem/view/intro/components/Icon.dart';
import 'package:cenem/view/intro/components/intro_body.dart';
import 'package:cenem/view/intro/components/social_media_list.dart';
import 'package:cenem/view%20model/responsive.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const AnimatedImageContainer(),
            const Spacer(),
            const IntroBody(),
            const Spacer(),
            if (!Responsive.isLargeMobile(context)) const SocialMediaIconList(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.09,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),

        child: AdScreen(), // Your ad screen widget
      ),
    );
  }
}
