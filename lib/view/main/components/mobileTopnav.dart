import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';
import 'package:cenem/view/onbonding/sign_dialog.dart';

import 'package:cenem/view/onbonding/sign_page.dart';
import 'package:cenem/view/onbonding/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';

class MobileTopNavigationBar extends StatelessWidget {
  const MobileTopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Responsive.isExtraLargeScreen(context) ||
              Responsive.isDesktop(context) ||
              !Responsive.isTablet(context))
            const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: CustomIconRow()),

          SizedBox(
            width: !Responsive.isDesktop(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : 150,
            child: CustomButton(
              onTap: () {
                authController.setSignUp(false); // Set isSignUp to false
                if (Responsive.isLargeMobile(context) ||
                    Responsive.isMobile(context)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(sign: false),
                    ),
                  );
                } else {
                  showSignUpDialog(
                    context,
                    onValue: (_) {},
                  );
                }
              },
              buttonText: 'تسجيل دخول',
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: !Responsive.isDesktop(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : 150,
            child: CustomButton(
              onTap: () {
                authController.setSignUp(true);

                if (Responsive.isLargeMobile(context) ||
                    Responsive.isMobile(context)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(sign: true),
                    ),
                  );
                } else {
                  showSignUpDialog(
                    context,
                    onValue: (_) {},
                  );
                }
              },
              buttonText: 'انشاء حساب',
            ),
          ),
          //const Spacer(),
        ],
      ),
    );
  }
}
    // if (Responsive.isLargeMobile(context)) MenuButton(),
          // const Spacer(
          //   flex: 2,
          // ),
          // if (!Responsive.isLargeMobile(context)) const NavigationButtonList(),
          // const Spacer(
          //   flex: 2,
          // ),