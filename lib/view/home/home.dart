import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/Icon.dart';
import 'package:cenem/view/intro/components/combine_subtitle.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/intro/components/headline.dart';

import 'package:cenem/view/main/components/navigation_bar.dart';
import 'package:cenem/view/main/components/navigation_button_list.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:cenem/view/intro/introduction.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String s = 'استثمر وقتك و اربح الاضعاف و  تعلم كسب الاموال بدورات مجانيه ';
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: TopNavigationBar(),
          ),
          if (!Responsive.isDesktop(context))
            const Center(
                child: Row(
              children: [Spacer(), NavigationButtonList(), Spacer()],
            )),
          if (Responsive.isDesktop(context))
            const Expanded(child: Introduction())
          else
            Expanded(child: NewWidget(size: size, s: s)),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.size,
    required this.s,
  });

  final Size size;
  final String s;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const AnimatedImageContainer(
            width: 150,
            height: 200,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const CombinetitleText(),
          const SizedBox(
            height: 5,
          ),
          const CombineSubtitleText(),
          const SizedBox(height: defaultPadding * 2),
          Responsive(
            desktop: AnimatedDescriptionText(start: 14, end: 12, text: s),
            largeMobile: AnimatedDescriptionText(start: 14, end: 12, text: s),
            mobile: AnimatedDescriptionText(start: 10, end: 12, text: s),
            tablet: AnimatedDescriptionText(start: 20, end: 25, text: s),
          ),
          CustomButton(
            onTap: () => launchUrl(Uri.parse(
                "https://drive.google.com/file/d/1tT_sNbd3EAyDwoIhIgdsoOeKyb6-aBxh/view?usp=drive_link")),
            buttonText: "الفيديو التعريفي",
            width: 150,
            height: 30,
          )
        ],
      ),
    );
  }
}
