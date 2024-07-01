import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AddScreenMobile extends StatefulWidget {
  @override
  _AdsScreenMobileState createState() => _AdsScreenMobileState();
}

class _AdsScreenMobileState extends State<AddScreenMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * .09, // Specify a finite height
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: second,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: <Color>[first, second],
                  ).createShader(bounds);
                },
                child: Marquee(
                  text:
                      'احصل على رحلة مجانية من خلال تجميعك لـ500 مشترك ابدأ الآن',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width *
                        0.03, // Adjust the multiplier as needed
                    fontWeight: FontWeight.bold,
                    color: second,
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  blankSpace: 20.0,
                  velocity: 50.0,
                  pauseAfterRound: Duration(milliseconds: 0),
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                  fadingEdgeStartFraction: 0.1,
                  fadingEdgeEndFraction: 0.1,
                )),
          ),
        ],
      ),
    );
  }
}
