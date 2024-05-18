import 'package:flutter/material.dart';

class TextWithGradient extends StatelessWidget {
  const TextWithGradient({Key? key, required this.start, required this.end});

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Colors.pink, // Example start color
                Colors.blue, // Example end color
              ],
            ).createShader(bounds);
          },
          child: Text(
            'الشبكة التعاونية للتسويق الالكتروني',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors
                      .white, // Text color will be overridden by the gradient
                  fontWeight: FontWeight.w900,
                  height: 0,
                  fontSize: value,
                ),
          ),
        );
      },
    );
  }
}
