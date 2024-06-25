import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen>
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
      curve: Curves.easeInOut,
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
      height: 80, // Specify a finite height
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ScaleTransition(
            scale: _animation,
            child: const TextWithGradient(
              start: 20,
              text: '     اعلان   ',
              end: 25,
            ),
          ),
          SizedBox(
            width: 20,
            height: 100,
          ),
          Expanded(
            child: Marquee(
              text:
                  '     احصل على رحله مجانيه  من خلال تجميعك ل 500 مشترك  ابدا الان   ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 7, 7, 7),
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.end,
              blankSpace: 20.0,
              velocity: 50.0, // Adjust velocity as needed
              pauseAfterRound:
                  Duration(milliseconds: 0), // No pause between rounds
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,

              fadingEdgeStartFraction: 0.1,
              fadingEdgeEndFraction: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
