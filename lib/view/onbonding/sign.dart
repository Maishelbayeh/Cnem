import 'package:cenem/view/onbonding/sign_in_dialog.dart';

import 'package:flutter/material.dart';

import '../../res/constants.dart';

class SignButton extends StatelessWidget {
  final double width;

  const SignButton({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {
          showCustomDialog(
            context,
            onValue: (_) {},
          );
        },
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        child: Container(
            height: 60,
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
                //  const Icon(FontAwesomeIcons.whatsapp,color: Colors.greenAccent,size: 15,),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  'sign In',
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
