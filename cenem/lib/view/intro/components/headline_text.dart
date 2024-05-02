import 'package:flutter/material.dart';

class text extends StatelessWidget {
  const text({super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return TweenAnimationBuilder(
        tween: Tween(begin: start, end: end),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Text('ُBecome a professional in ',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: const Color.fromARGB(255, 11, 11, 11),
                  fontWeight: FontWeight.w900,
                  height: 0,
                  fontSize: value));
        },
      );
    });
  }
}
