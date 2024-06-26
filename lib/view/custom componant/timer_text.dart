import 'dart:async';
import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
  const TimerText({super.key});

  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  late Timer _timer;
  int _start = 120;
  bool _isClickable = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isClickable = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      _start = 120;
      _isClickable = false;
    });
    _timer.cancel();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      
        _isClickable
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    resetTimer();
                    print("Resend code clicked");
                  },
                  child: const Text(
                    "اعدّ الارسال",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            : Text(
                "Resend in $_start seconds",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
      ],
    );
  }
}
