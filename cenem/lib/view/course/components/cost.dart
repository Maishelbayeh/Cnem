import 'package:cenem/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view/main/components/subtitle_text.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../view model/responsive.dart';

// ignore: must_be_immutable
class CostText extends StatelessWidget {
  CostText({super.key, required this.index});

  int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (kIsWeb && Responsive.isLargeMobile(context)
            ? const Responsive(
                desktop: coloredText(
                  start: 30,
                  end: 40,
                  text: 'Cost : ',
                  gradient: true,
                  fontsize: 18,
                ),
                largeMobile: coloredText(
                    start: 30,
                    end: 25,
                    text: 'Cost : ',
                    gradient: true,
                    fontsize: 15),
                mobile: coloredText(
                    start: 25,
                    end: 20,
                    text: 'Cost : ',
                    gradient: true,
                    fontsize: 12),
                tablet: coloredText(
                    start: 40,
                    end: 30,
                    text: 'Cost : ',
                    gradient: true,
                    fontsize: 15),
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
                    start: 30,
                    end: 40,
                    text: 'Cost  : ',
                    gradient: false,
                    fontsize: 18,
                  ),
                  largeMobile: coloredText(
                      start: 30,
                      end: 25,
                      text: 'Cost : ',
                      gradient: false,
                      fontsize: 15),
                  mobile: coloredText(
                      start: 25,
                      end: 20,
                      text: 'Cost : ',
                      gradient: false,
                      fontsize: 12),
                  tablet: coloredText(
                      start: 40,
                      end: 30,
                      text: 'Cost : ',
                      gradient: false,
                      fontsize: 15),
                ),
              )),
        Responsive(
          desktop: AnimatedSubtitleText(
            start: 30,
            end: 40,
            text: '  ${CourseList[index].cost.toString()} ',
            fontsize: 18,
          ),
          largeMobile: AnimatedSubtitleText(
            start: 30,
            end: 25,
            text: '  ${CourseList[index].cost.toString()} ',
            fontsize: 15,
          ),
          mobile: AnimatedSubtitleText(
            start: 25,
            end: 20,
            text: '  ${CourseList[index].cost.toString()} ',
            fontsize: 12,
          ),
          tablet: AnimatedSubtitleText(
            start: 40,
            end: 30,
            text: '  ${CourseList[index].cost.toString()} ',
            fontsize: 15,
          ),
        ),
      ],
    );
  }
}
