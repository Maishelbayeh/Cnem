import 'package:flutter/material.dart';
import 'package:cenem/view/intro/components/subtitle_text.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../view model/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Responsive(
          desktop: AnimatedSubtitleText(
              start: 30, end: 40, text: 'ُE marketing with '),
          largeMobile: AnimatedSubtitleText(
              start: 30, end: 25, text: 'E marketing with '),
          mobile: AnimatedSubtitleText(
              start: 25, end: 20, text: 'Emarketing with '),
          tablet: AnimatedSubtitleText(
              start: 40, end: 30, text: 'E marketing with '),
        ),
        (kIsWeb && Responsive.isLargeMobile(context)
            ? const Responsive(
                desktop: coloredText(
                    start: 30, end: 40, text: 'Cnem ', gradient: true),
                largeMobile: coloredText(
                    start: 30, end: 25, text: 'Cnem ', gradient: true),
                mobile: coloredText(
                    start: 25, end: 20, text: 'Cnem ', gradient: true),
                tablet: coloredText(
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
                  desktop: coloredText(
                      start: 30, end: 40, text: 'Cnem ', gradient: false),
                  largeMobile: coloredText(
                      start: 30, end: 25, text: 'Cnem ', gradient: false),
                  mobile: coloredText(
                      start: 25, end: 20, text: 'Cnem ', gradient: true),
                  tablet: coloredText(
                      start: 40, end: 30, text: 'Cnem ', gradient: false),
                ),
              ))
      ],
    );
  }
}
