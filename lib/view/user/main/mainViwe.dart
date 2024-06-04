import 'package:cenem/view/user/main/components/ButtonListMember.dart';
import 'package:cenem/view/user/main/components/TopNavMember.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/controller.dart';
import 'package:cenem/res/constants.dart';

import '../../../view model/responsive.dart';
import 'package:cenem/view/main/components/drawer/drawer.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class MainViewMember extends StatelessWidget {
  const MainViewMember({super.key, required this.pages});
  final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
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
            if (Responsive.isLargeMobile(context))
              const Row(
                children: [Spacer(), NavigationButtonListMember(), Spacer()],
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
