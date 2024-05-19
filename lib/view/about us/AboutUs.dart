import 'package:cenem/view/about%20us/componants/image_grid.dart';
import 'package:cenem/view/main/components/drawer/drawer_image.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';

import 'componants/Icon.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: Center(
                child: UserImageContainerWrapper(
                  width: 200,
                  height: 200,
                  space: 40,
                ),
              ),
            ),
          if (Responsive.isLargeMobile(context) || Responsive.isMobile(context))
            const Expanded(
              child: Center(
                child:
                    UserImageContainerWrapper(width: 70, height: 70, space: 10),
              ),
            ),
          if (!Responsive.isDesktop(context) &&
              !Responsive.isLargeMobile(context))
            const Expanded(
              child: Center(
                child: UserImageContainerWrapper(
                    width: 100, height: 100, space: 30),
              ),
            ),
        ],
      ),
    );
  }
}
