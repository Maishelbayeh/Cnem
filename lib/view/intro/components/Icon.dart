import 'package:flutter/material.dart';
import 'package:cenem/view/video/components/video_grid.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        debugLabel: "فيديو التعريفي")
      ..repeat(reverse: true); // Repeat the animation loop
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
              borderRadius: BorderRadius.circular(30),
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 251, 251),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/cnem.png',
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
                  Icon(
                    Icons.play_circle_filled,
                    size: widget.width! * 0.25,
                    color: Color.fromARGB(96, 7, 0, 103),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
