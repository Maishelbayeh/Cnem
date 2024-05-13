import 'package:cenem/view%20model/getx_controllers/certification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';
import 'certificates_details.dart';

class ManegerCard extends StatelessWidget {
  final CertificationController controller = Get.put(CertificationController());

  ManegerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink,
                  offset: const Offset(-2, 0),
                  blurRadius: controller.hovers[0] ? 20 : 10,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: const Offset(2, 0),
                  blurRadius: controller.hovers[0] ? 20 : 10,
                ),
              ],
            ),
            child: CertificateStack(index: 0),
          ),
          // if(controller.hovers[0])
          //   Positioned(
          //     bottom: defaultPadding,
          //     left: defaultPadding,
          //     right: defaultPadding,
          //     child: Container(
          //       padding: const EdgeInsets.all(20),
          //       height: 100,
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.7),
          //         borderRadius: BorderRadius.circular(defaultPadding),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
