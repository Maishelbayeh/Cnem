import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SetNewPasswordPage extends StatefulWidget {
  @override
  _SetNewPasswordState createState() => _SetNewPasswordState();
}

class   _SetNewPasswordState extends  State<SetNewPasswordPage> {
    bool _obscureText = false;
      bool _obscureText1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const AnimatedDescriptionText(
              start: 18, end: 22, text:"اعـادة تعيين كلمة المرور"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock,
                size: 100.0,
                color: Colors.blue.shade900,
              ),
              SizedBox(height: 40.0),
                                Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: SizedBox(
        child: TextFormField(
          cursorColor: Colors.blue,
          validator: (value) {
            // Add your validation logic here
          },
          obscureText: _obscureText1,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'كلمة المرور',
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  "icons/password.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText1 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText1 = !_obscureText1;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    ),
              SizedBox(height: 20.0),
            
                  Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: SizedBox(
        child: TextFormField(
          cursorColor: Colors.blue,
          validator: (value) {
            // Add your validation logic here
          },
          obscureText: _obscureText,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'تأكيد كلمة المرور',
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  "icons/password.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    ),
              SizedBox(height: 40.0),
              
                CustomButton(
                    buttonText: 'تغيير كلمة السر',
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           ConformEmailPage('', email: email.text)),
                      // );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
