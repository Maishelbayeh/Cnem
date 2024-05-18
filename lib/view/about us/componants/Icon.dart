import 'package:flutter/material.dart';

import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class UserImageContainer extends StatefulWidget {
  const UserImageContainer(
      {Key? key, this.height = 80, this.width = 80, this.imagePath = ''})
      : super(key: key);
  final double? width;
  final double? height;
  final String imagePath;
  @override
  UserImageContainerState createState() => UserImageContainerState();
}

class UserImageContainerState extends State<UserImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down

          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.width! /
                  2), // Set borderRadius to half of width for a circular shape
              gradient: const LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.blue,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: ClipOval(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 251, 251),
                ),
                child: Image.asset(
                  widget.imagePath,
                  height: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 200,
                  width: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
