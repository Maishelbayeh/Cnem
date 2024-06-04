import 'package:flutter/material.dart';
import 'package:cenem/view/main/components/drawer/about.dart';
import 'package:cenem/view/main/components/drawer/contact_icons.dart';
import 'package:cenem/view/main/components/drawer/knowledges.dart';
import 'package:cenem/view/main/components/drawer/my_skill.dart';
import 'package:cenem/view/main/components/drawer/personal_info.dart';
import 'package:cenem/res/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              color: bgColor,
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  children: [
                    PersonalInfo(),
                    MySKills(),
                    Knowledges(),
                    Divider(),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    ContactIcon(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
