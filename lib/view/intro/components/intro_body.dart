import 'package:cenem/view/intro/components/headline.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
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
        SingleChildScrollView(
          child: Column(
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
                  height: size.height * 0.1,
                ),
              const CombinetitleText(),

              if (!Responsive.isDesktop(context))
                const SizedBox(
                  height: defaultPadding,
                ),
              const CombineSubtitleText(),
              const SizedBox(height: defaultPadding * 2),
              Responsive(
                desktop: AnimatedDescriptionText(start: 20, end: 30, text: s),
                largeMobile:
                    AnimatedDescriptionText(start: 14, end: 12, text: s),
                mobile: AnimatedDescriptionText(start: 14, end: 12, text: s),
                tablet: AnimatedDescriptionText(start: 17, end: 14, text: s),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              //const DownloadButton(),
            ],
          ),
        ),
      ],
    );
  }
}
