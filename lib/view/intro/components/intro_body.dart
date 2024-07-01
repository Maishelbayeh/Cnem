import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/headline.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AnimatedDescriptionText(
                        start: 15, end: 20, text: "كن شريكا في النجاح"),
                    SizedBox(
                      height: defaultPadding * 2,
                      width: defaultPadding * 2,
                    ),
                    AnimatedDescriptionText(
                        start: 15, end: 20, text: " للباحثين عن العمل "),
                  ],
                ),
                SizedBox(
                  height: defaultPadding * 2,
                  width: defaultPadding * 2,
                ),
                Column(
                  children: [
                    AnimatedDescriptionText(
                        start: 15, end: 20, text: "للباحثين عن عمل اضافي  "),
                    SizedBox(
                      height: defaultPadding * 2,
                      width: defaultPadding * 2,
                    ),
                    AnimatedDescriptionText(
                        start: 20,
                        end: 25,
                        text: "للمتعلمين و لغير المتعلمين "),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
          ],
        ),
      ],
    );
  }
}
