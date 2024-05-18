import 'package:cenem/res/constants.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JoinButton extends StatelessWidget {
  final double width;
  final double height;

  const JoinButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 255, 1, 86),
                  Colors.blue.shade900,
                ]),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blue,
                      offset: Offset(0, -1),
                      blurRadius: defaultPadding / 4),
                  BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 1),
                      blurRadius: defaultPadding / 4),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Icon(
                //   FontAwesomeIcons.whatsapp,
                //   color: Colors.greenAccent,
                //   size: 15,
                // ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  'اشترك مجانا',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            )),
      ),
    );
  }
}
