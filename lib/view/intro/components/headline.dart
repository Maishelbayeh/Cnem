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
              Colors.pink,
              Colors.blue,
            ]).createShader(bounds);
          },
          child: const Responsive(
            desktop: ColoredText(
                start: 30,
                end: 50,
                text: 'الشبكة التعاونية للتسويق الالكتروني',
                gradient: false),
            largeMobile: ColoredText(
                start: 20,
                end: 30,
                text: 'الشبكة التعاونية للتسويق الالكتروني',
                gradient: false),
            mobile: ColoredText(
                start: 20,
                end: 30,
                text: 'الشبكة التعاونية للتسويق الالكتروني',
                gradient: false),
            tablet: ColoredText(
                start: 40,
                end: 30,
                text: 'الشبكة التعاونية للتسويق الالكتروني',
                gradient: false),
          ),
        )
      ],
    );
  }
}
