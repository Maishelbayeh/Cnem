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
                desktop: ColoredText(
                  start: 15,
                  end: 20,
                  text: 'الثمن الاصلي: ',
                  gradient: true,
                  fontsize: 18,
                ),
                largeMobile: ColoredText(
                    start: 10,
                    end: 15,
                    text: 'الثمن الاصلي: ',
                    gradient: true,
                    fontsize: 15),
                mobile: ColoredText(
                    start: 10,
                    end: 15,
                    text: 'الثمن الاصلي: ',
                    gradient: true,
                    fontsize: 12),
                tablet: ColoredText(
                    start: 10,
                    end: 15,
                    text: 'الثمن الاصلي: ',
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
                  desktop: ColoredText(
                    start: 15,
                    end: 20,
                    text: 'الثمن الاصلي : ',
                    gradient: false,
                    fontsize: 18,
                  ),
                  largeMobile: ColoredText(
                      start: 10,
                      end: 15,
                      text: 'الثمن الاصلي: ',
                      gradient: false,
                      fontsize: 15),
                  mobile: ColoredText(
                      start: 10,
                      end: 15,
                      text: 'الثمن الاصلي: ',
                      gradient: false,
                      fontsize: 12),
                  tablet: ColoredText(
                      start: 10,
                      end: 15,
                      text: 'الثمن الاصلي: ',
                      gradient: false,
                      fontsize: 15),
                ),
              )),
        Responsive(
          desktop: AnimatedSubtitleText(
            start: 15,
            end: 20,
            text: '${courseList[index].cost.toString()} ',
          ),
          largeMobile: AnimatedSubtitleText(
            start: 10,
            end: 15,
            text: '  ${courseList[index].cost.toString()} ',
            fontsize: 15,
          ),
          mobile: AnimatedSubtitleText(
            start: 10,
            end: 15,
            text: '  ${courseList[index].cost.toString()} ',
            fontsize: 12,
          ),
          tablet: AnimatedSubtitleText(
            start: 10,
            end: 15,
            text: '  ${courseList[index].cost.toString()} ',
            fontsize: 15,
          ),
        ),
      ],
    );
  }
}
