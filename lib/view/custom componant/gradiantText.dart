import 'package:flutter/material.dart';

class TextWithGradient extends StatelessWidget {
  const TextWithGradient({
    Key? key,
    required this.start,
    required this.end,
    required this.text,
  }) : super(key: key);

  final double start;
  final double end;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.pink, // Example start color
                Colors.blue, // Example end color
              ],
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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
