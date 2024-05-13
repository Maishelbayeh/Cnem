import 'package:cenem/model/certificate_model%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import 'certificates_details.dart';

class CertificateGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  final int itemCount;
  CertificateGrid(
      {super.key,
      this.crossAxisCount = 3,
      this.ratio = 1.3,
      required this.itemCount});
  final controller = Get.put(CertificationController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: certificateList.length - itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        final adjustedIndex = index + itemCount;
        return Obx(() => Center(
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(
                        vertical: defaultPadding, horizontal: defaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        Colors.pinkAccent,
                        Colors.blue,
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink,
                          offset: const Offset(-2, 0),
                          blurRadius:
                              controller.hovers[adjustedIndex] ? 20 : 10,
                        ),
                        BoxShadow(
                          color: Colors.blue,
                          offset: const Offset(2, 0),
                          blurRadius:
                              controller.hovers[adjustedIndex] ? 20 : 10,
                        ),
                      ],
                    ),
                    child: CertificateStack(index: adjustedIndex),
                  ),
                  //           if(controller.hovers[index])
                  // Positioned(
                  //   bottom: defaultPadding,
                  //   left: defaultPadding,
                  //   right: defaultPadding,
                  //   child: Container(
                  //     padding: EdgeInsets.all(20),
                  //     height: 100,
                  //     decoration: BoxDecoration(
                  //       color: Colors.black.withOpacity(0.7),
                  //       borderRadius: BorderRadius.circular(defaultPadding), // Adjust the radius as needed
                  //     ),
                  //   ),

                  //           ),
                ],
              ),
            ));
      },
    );
  }
}
