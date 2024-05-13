import 'package:cenem/model/certificate_model%20.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';

class CertificateStack extends StatelessWidget {
  final controller = Get.put(CertificationController());
  CertificateStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: bgColor),
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height *
                        0.1, // default value
                    backgroundImage: AssetImage('./assets/images/test.jpeg'),
                  ),
                  Text(
                    certificateList[index].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    certificateList[index].role,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    certificateList[index].description,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(certificateList[index].email),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
