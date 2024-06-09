import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/headline.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'Icon.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    String s = 'استثمر وقتك و اربح الاضعاف و  تعلم كسب الاموال بدورات مجانيه ';
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.06,
        ),
        if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
        SizedBox(
          width: size.width * 0.06,
        ),
        Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height * 0.06,
              ),
            if (!Responsive.isDesktop(context))
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Align children vertically to the center
                children: [
                  AnimatedImageContainer(
                    width: 150,
                    height: 200,
                  ),
                ],
              ),

            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height * 0.04,
              ),
            const CombinetitleText(),

            if (!Responsive.isDesktop(context))
              const SizedBox(
                height: 5,
              ),
            const CombineSubtitleText(),
            const SizedBox(height: defaultPadding * 2),
            Responsive(
              desktop: AnimatedDescriptionText(start: 14, end: 12, text: s),
              largeMobile: AnimatedDescriptionText(start: 14, end: 12, text: s),
              mobile: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AnimatedDescriptionText(start: 10, end: 12, text: s),
              ),
              tablet: AnimatedDescriptionText(start: 17, end: 14, text: s),
            ),
            CustomButton(
              onTap: () => launchUrl(Uri.parse(
                  "https://drive.google.com/file/d/1tT_sNbd3EAyDwoIhIgdsoOeKyb6-aBxh/view?usp=drive_link")),
              buttonText: "الفيديو التعريفي",
              height: 40,
              width: 150,
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            //const DownloadButton(),
          ],
        ),
      ],
    );
  }
}
