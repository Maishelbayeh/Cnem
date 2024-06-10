import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';
import 'package:cenem/view/user/main/components/TopNavMember.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/main/components/navigation_bar.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class MainViewMember extends StatelessWidget {
  const MainViewMember({super.key, required this.pages});

  final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(
                    height: defaultPadding * 2,
                  )
                : const SizedBox(
                    height: defaultPadding / 2,
                  ),
            const SizedBox(
              height: 80,
              child: TopNavigationBarMember(),
            ),
            // if (Responsive.isLargeMobile(context))
            //   const Row(
            //     children: [Spacer(), NavigationButtonList(), Spacer()],
            //   ),
            if (!Responsive.isDesktop(context))
              const Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: CustomIconRow()),
                ],
              ),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                //physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [...pages],
              ),
            )
          ],
        ),
      ),
    );
  }
}
