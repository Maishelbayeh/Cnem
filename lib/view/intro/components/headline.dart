import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cenem/view/custom%20componant/subtitle_text.dart';
import '../../../view model/responsive.dart';

class CombinetitleText extends StatelessWidget {
  const CombinetitleText({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              first,
              second,
            ]).createShader(bounds);
          },
          // child: const Responsive(
          //   desktop: ColredText(
          //     start: 30,
          //     end: 35,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          //   largeMobile: ColredText(
          //     start: 10,
          //     end: 20,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          //   mobile: ColredText(
          //     start: 10,
          //     end: 15,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          //   tablet: ColredText(
          //     start: 50,
          //     end: 40,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          // ),
          child: const Responsive(
            desktop: ColoredText(
                start: 30,
                end: 40,
                text: 'الشبكة التعاونية للتسويق الالكتروني ',
                gradient: false),
            largeMobile: ColoredText(
                start: 30,
                end: 25,
                text: 'الشبكة التعاونية للتسويق الالكتروني ',
                gradient: false),
            mobile: ColoredText(
                start: 25,
                end: 20,
                text: 'الشبكة التعاونية للتسويق الالكتروني ',
                gradient: false),
            tablet: ColoredText(
                start: 40,
                end: 30,
                text: 'الشبكة التعاونية للتسويق الالكتروني ',
                gradient: false),
          ),
        )
      ],
    );
  }
}
