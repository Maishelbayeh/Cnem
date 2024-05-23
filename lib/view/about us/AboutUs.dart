import 'package:cenem/res/constants.dart';
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
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height:
                  defaultPadding, // Ensure you define defaultPadding somewhere in your code
            ),
          const SizedBox(
            height: defaultPadding,
          ),
          const Expanded(
            child: Responsive(
              desktop: Center(
                child: UserImageContainerWrapper(
                  width: 200,
                  height: 200,
                  space: 40,
                ),
              ),
              extraLargeScreen: Center(
                child: UserImageContainerWrapper(
                  width: 250,
                  height: 250,
                  space: 50,
                ),
              ),
              largeMobile: Center(
                child: UserImageContainerWrapper(
                  width: 70,
                  height: 70,
                  space: 10,
                ),
              ),
              mobile: Center(
                child: UserImageContainerWrapper(
                  width: 70,
                  height: 70,
                  space: 10,
                ),
              ),
              tablet: Center(
                child: UserImageContainerWrapper(
                  width: 150,
                  height: 150,
                  space: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
