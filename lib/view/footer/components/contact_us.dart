import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/footer/components/contact_us_form.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                  height: MediaQuery.of(context).size.width * 0.35,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.black,
                ),
          Container(
            height: MediaQuery.of(context).size.width * 0.35, 
            width: MediaQuery.of(context).size.width * 0.58,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset:const Offset(0, 3), // changes position of shadow
                ),
              ],
              
            ),
          child:const ContactUsForm(),
          ),
          
        ],
      ),
      largeMobile :SingleChildScrollView(
  child: Column(
    children: [
      Column(
        children: [
          Container(
            // Fixed height for the shadowed container
            height: MediaQuery.of(context).size.height / 2, 
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
          
          ),
            Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
                ),
        ],
      ),
      // Additional widgets can be added below the shadowed container
    ],
  ),
),


      mobile:SingleChildScrollView(
  child: Column(
    children: [
      Column(
        children: [
          Container(
            // Fixed height for the shadowed container
            height: MediaQuery.of(context).size.height / 2, 
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
          
          ),
            Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
                ),
        ],
      ),
      // Additional widgets can be added below the shadowed container
    ],
  ),
),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                  height: MediaQuery.of(context).size.width * 0.56,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.black,
                ),
          Container(
            height: MediaQuery.of(context).size.width * 0.56, 
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          child: ContactUsForm(),
          ),
          
        ],
      ),
      extraLargeScreen: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                  height: MediaQuery.of(context).size.width * 0.35,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.black,
                ),
          Container(
            height: MediaQuery.of(context).size.width * 0.35, 
            width: MediaQuery.of(context).size.width * 0.50,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          child:ContactUsForm(),
          ),
          
        ],
      ),
    );
  }
}
