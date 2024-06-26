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
              Colors.pink,
              Colors.blue,
            ]).createShader(bounds);
          },
          child: const Responsive(
            desktop: TextWithGradient(
              start: 30,
              end: 35,
              text: 'الشبكة التعاونية للتسويق الالكتروني',
            ),
            largeMobile: TextWithGradient(
              start: 10,
              end: 20,
              text: 'الشبكة التعاونية للتسويق الالكتروني',
            ),
            mobile: TextWithGradient(
              start: 10,
              end: 15,
              text: 'الشبكة التعاونية للتسويق الالكتروني',
            ),
            tablet: TextWithGradient(
              start: 50,
              end: 40,
              text: 'الشبكة التعاونية للتسويق الالكتروني',
            ),
          ),
        )
      ],
    );
  }
}
