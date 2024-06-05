import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/custom_text.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view model/getx_controllers/courses_controller.dart';
import 'package:cenem/view%20model/responsive.dart';

final controller = Get.put(CourseController());

void ForgotPasswordDialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Responsive(
        desktop: _buildDialog(context, 0.6, 0.7),
        largeMobile: _buildDialog(context, 0.8, 0.7),
        mobile: _buildDialog(context, 0.8, 0.6),
        tablet: _buildDialog(context, 0.8, 0.7),
        extraLargeScreen: _buildDialog(context, 0.6, 0.7),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
  ).then(onValue);
}

Widget _buildDialog(BuildContext context, double widthFactor, double heightFactor) {
  final Size screenSize = MediaQuery.of(context).size;
  double dialogWidth = screenSize.width * widthFactor;
  double dialogHeight = screenSize.height * heightFactor;

     return Center(
  child: Container(
    width: dialogWidth,
    height: dialogHeight,
    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
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
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 150*(dialogWidth/MediaQuery.of(context).size.width),
                  height: 150*(dialogWidth/MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset('assets/images/cnem.png', fit: BoxFit.contain),
                  ),
                ),
                
                CustomText(
                  start: 10,
                  end: 25,
                  text: 'تَحَقّق',
                  fontsize: 15,
                ),
                const Text(
                  'ادخل الرمز المرسل الى رقمك',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _textFieldOTP(first: true, last: false,context: context),
                    _textFieldOTP(first: false, last: false,context: context),
                    _textFieldOTP(first: false, last: false,context: context),
                    _textFieldOTP(first: false, last: true,context: context),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ButtonStyle(
                //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                //       backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(24.0),
                //         ),
                //       ),
                //     ),
                //     child: const Padding(
                //       padding: EdgeInsets.all(14.0),
                //       child: Text(
                //         'تَحَقّق',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 0),
                child: CustomButton(
                  width: screenSize.width * widthFactor,
                  onTap: () {},
                  buttonText: 'تَحَقّق',
                ),
              ),
              const TimerText(),
              const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
}



Widget _textFieldOTP({required bool first, required bool last,BuildContext ?context}) {
  return SizedBox(
    height: 50,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context!).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context!).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}
