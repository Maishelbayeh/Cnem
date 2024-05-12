import 'package:cenem/model/certificate_model.dart';
import 'package:cenem/view/certifications/components/managercard.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/getx_controllers/certification_controller.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/certification_grid.dart';

class Certifications extends StatelessWidget {
  final controller = Get.put(CertificationController());
  Certifications({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
      
          // const SizedBox(
          //   height: defaultPadding,
          // ),
          Responsive(
            desktop:
                  Expanded(
                    child: CertificateGrid(
                      crossAxisCount: 2,
                      ratio: 1.5,
                      itemCount: 0,
                    ),
                  
              
            ),
            largeMobile: Expanded(
              child: Expanded(
                child: CertificateGrid(
                    crossAxisCount: 1, ratio: 1.2, itemCount: 0),
              ),
            ),
            mobile: Expanded(
              child:
                  CertificateGrid(crossAxisCount: 1, ratio: 0.8, itemCount: 0),
            ),
            tablet: Expanded(
              child: CertificateGrid(ratio: 2, crossAxisCount: 1, itemCount: 0),
            ),
            extraLargeScreen: Expanded(
              child: Column(
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height / 2.3,
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: ManegerCard(),
                  // ),
                  // const SizedBox(height: 5),
                  Expanded(
                    child: CertificateGrid(
                        crossAxisCount: 2, ratio: 2, itemCount: 0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
