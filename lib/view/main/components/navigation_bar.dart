import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/social_media_coloumn.dart';
import 'package:cenem/view/main/components/drawer/contact_icons.dart';
import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';

import 'package:cenem/view/onbonding/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/intro/components/side_menu_button.dart';

import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
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
                  ? Image.asset('assets/images/cnem.png')
                  : const SocialMediaIconRow()),
          //if (Responsive.isLargeMobile(context)) MenuButton(),
          const Spacer(
            flex: 2,
          ),
          if (!Responsive.isLargeMobile(context)) const NavigationButtonList(),
          const Spacer(
            flex: 2,
          ),
          CustomButton(
            onTap: () {
              showCustomDialog(
                context,
                onValue: (_) {},
              );
            },
            buttonText: 'تسجيل دخول',
          ),
          const Spacer(),
          CustomButton(
            onTap: () {},
            buttonText: 'انشاء حساب',
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
