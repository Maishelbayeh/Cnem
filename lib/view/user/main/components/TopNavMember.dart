import 'package:cenem/model/user_model.dart';
import 'package:cenem/res/constants.dart';

import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:cenem/view/custom%20componant/social_icon.dart';
import 'package:cenem/view/intro/components/side_menu_button.dart';
import 'package:cenem/view/main/components/drawer/drawer_image.dart';

import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';

import 'package:cenem/view/user/main/components/ButtonListMember.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Member member = memberInfo;

class TopNavigationBarMember extends StatelessWidget {
  const TopNavigationBarMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: !Responsive.isLargeMobile(context)
                  ? const CustomIconRow()
                  : const CustomIconRow()),
          //if (Responsive.isLargeMobile(context)) MenuButton(),
          const Spacer(
            flex: 2,
          ),
          if (!Responsive.isLargeMobile(context))
            const NavigationButtonListMember(),
          const Spacer(
            flex: 2,
          ),
          // CustomButton(
          //   onTap: () {},
          //   buttonText: 'تسجيل الخروج',
          // ),
          const Spacer(),
          TextWithGradient(start: 20, end: 25, text: memberInfo.name),
          const SizedBox(width: 20),
          MenuButton(onTap: () => Scaffold.of(context).openEndDrawer()),

          const Spacer(),
        ],
      ),
    );
  }
}
