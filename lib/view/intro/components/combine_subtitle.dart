import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cenem/view/custom%20componant/subtitle_text.dart';
import '../../../view model/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (kIsWeb && Responsive.isLargeMobile(context)
            ? const Responsive(
                desktop: ColoredText(
                    start: 30, end: 40, text: 'Cnem ', gradient: true),
                largeMobile: ColoredText(
                    start: 30, end: 25, text: 'Cnem ', gradient: true),
                mobile: ColoredText(
                    start: 25, end: 20, text: 'Cnem ', gradient: true),
                tablet: ColoredText(
                    start: 40, end: 30, text: 'Cnem ', gradient: true),
              )
            : ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(colors: [
                    Colors.pink,
                    Colors.blue,
                  ]).createShader(bounds);
                },
                child: const Responsive(
                  desktop: ColoredText(
                      start: 30, end: 40, text: 'Cnem ', gradient: false),
                  largeMobile: ColoredText(
                      start: 30, end: 25, text: 'Cnem ', gradient: false),
                  mobile: ColoredText(
                      start: 25, end: 20, text: 'Cnem ', gradient: true),
                  tablet: ColoredText(
                      start: 40, end: 30, text: 'Cnem ', gradient: false),
                ),
              ))
      ],
    );
  }
}
