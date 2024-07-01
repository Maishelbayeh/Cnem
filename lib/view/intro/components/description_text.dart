import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
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
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: second,
                wordSpacing: 2,
                fontSize: value, // Animating font size from start to end
              ),
        );
      },
    );
  }
}
