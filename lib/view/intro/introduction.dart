import 'package:cenem/view/intro/components/Icon.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/intro/components/intro_body.dart';

import 'package:cenem/view/intro/components/social_media_list.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
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
            width: MediaQuery.sizeOf(context).width * 0.09,
          ),
        ],
      ),
    );
  }
}
