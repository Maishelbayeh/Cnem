import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/intro/components/intro_body.dart';

import 'package:cenem/view/intro/components/social_media_list.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //   width: MediaQuery.sizeOf(context).width * 0.02,
        // ),
        const Expanded(
          child: IntroBody(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.04,
        ),
        if (!Responsive.isLargeMobile(context)) const SocialMediaIconList(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.09,
        ),
      ],
    );
  }
}
