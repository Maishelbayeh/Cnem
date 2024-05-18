import 'package:cenem/view/onbonding/sign_in_dialog.dart';

import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

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
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
            height: 60,
            width: 100,
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
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}
