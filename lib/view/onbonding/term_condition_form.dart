import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/onbonding/auth_controller.dart';
import 'package:cenem/view/onbonding/bank_info_page.dart';
import 'package:cenem/view/onbonding/sign_dialog.dart';
import 'package:cenem/view/onbonding/sign_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TermsAndConditionsPage extends StatefulWidget {
  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _isChecked = false;

  final AuthController authController = Get.put(AuthController());

  void _onCheckedChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _onNextPressed() {
    if (_isChecked) {
      authController.setSignUp(true);

      if (Responsive.isLargeMobile(context) || Responsive.isMobile(context)) {
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

      print("Navigating to the next page...");
    }
  }

  Widget _buildTermText(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = Responsive.isLargeMobile(context)
        ? screenWidth * 0.025
        : screenWidth * 0.015; // Adjust the multiplier as needed
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedDescriptionText(
              text: 'سـيـاسـات وشـروطـ العـضـويـة فـي الشــبكـة',
              start: 14,
              end: 15,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const AnimatedDescriptionText(
              text:
                  "\u202B1 - العمل مع الشبكة هو بنظام تعاوني لانجاح مشاريع تجارية مستقلة لكل عضو ولا يخضع لانظمة وقوانين العمل.",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B2 - الهدف من العضوية في الشبكة هو تحقيق الارباح المالية من الانترنت وفريق العمل، لذلك يمنع تداول او مناقشة اي موضوع اخر ( سياسي او ديني او اجتماعي  ... الخ ) في الشبكة.",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B3 - يمنع استخدام شعار واسم الشبكة خارج القنوات الرسمية للشبكة ( الموقع والتطبيق ) الالكتروني فقط ويمنع استخدامه في اي اعلان او ما شابه.",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B4 - يسمح للاعضاء والمنتسبين استخدام اسم وشعار الشبكة بشرط اضافة اسمهم الشخصي بجانب الاسم او الشعار.",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B5 - لجذب اعضاء جدد للشبكة يتم من خلال العرض التقديمي فقط الموجود على القنوات الرسمية للشبكة .",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B6 - يمنع اي تداول مادي خارج الحساب البنكي الرسمي للشبكة .",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B7 - رسوم العضوية والانتساب ( الاسعار او نوع العمله قابله للتغير مستقبلا) ",
              start: 10,
              end: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                text: "الانتساب : 20 دولار لمره واحده فقط",
                start: 9,
                end: 12,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                text: "الشهرية : 25 دولار",
                start: 9,
                end: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B8 - احتساب الشهور : يحتسب الشهر من الاول من كل شهر وحتى اخر يوم من الشهر .) ",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text: "\u202B9 - مسميات العضوية الشبكة :) ",
              start: 10,
              end: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                text:
                    "أ . منتسب : وهو الشهر الاول للانضمام وعليه دفع رسوم الانتساب + الرسوم الشهرية .\n ملاحظة : المنتسب  لا يحصل على عمولات من الفريق ولا يدفع عليه عمولات لمن احضره.\n ملاحظة : اي يوم من الانضمام  1 وحتى اخر يوم في الشهر يعتبر منتسب وعليه دفع رسوم الانتساب كامله والرسوم الشهرية ( في حال تم التسجيل بعد الخامس من الشهر يتم احتساب دولار عن كل يوم لنهاية الشهر) وبمجرد دخول الشهر الجديد يلتزم بدفع الرسوم الشهرية الجديدة.",
                start: 9,
                end: 12,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                text:
                    "ب . عضو ملتزم : وهو من بعد الالتزام بدفع اشتراك الشهر الثاني او اي شهر ما بعده بشرط الالتزام بدفع الرسوم الشهرية اول خمس ايام من الشهر كحد اقصى والعضو يحصل على عمولات من فريقه المباشر من الاعضاء الملتزمين فقط ولا يحصل على عمولات من المنتسبين.",
                start: 9,
                end: 12,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                text:
                    "ج . عضو مجمد : وهو الغير ملتزم بدفع الرسوم الشهرية بالموعد المحدد حتى الخامس من كل شهر ( تم الدفع خلال ال 6 – نهاية الشهر) \n ويسمح له بالدفع في اي يوم من الشهر للحفاظ على فريقه للاشهر القادمه ويخسر عمولة الفريق عن الشهر المتأخر في سداده",
                start: 9,
                end: 12,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AnimatedDescriptionText(
                text:
                    "د . عضو موقوف : وهو من لم يسدد الرسوم الشهرية خلال الشهر وعليه يخسر فريقه ورقمه الخاص فيه بالشبكه والعمولات ولا يحق له بالمطالبه باستعاده فريقه او العمولات ( في بعض الحالات القاهرة مثل السجن او المرضي في المستشفى او ما شابه يتم النظر باستعاده فريقة بشرط عدم المطالبة بالعمولات السابقة وتقديم الاوراق الاثباتية لذلك).",
                start: 9,
                end: 12,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                text:
                    "هـ .عضو مفصول : وهو من خرج عن غايات واهداف الشبكة و نشر اي نشاط سياسي او حزبي او ديني او تجاوز اخلاقي او ما شابه داخل الشبكه ويخسر جميع عمولاته ورقمه وفريقه ولا يحق له بالمطالبه للعوده الى الشبكة او اي تسجيل جديد مستقبلي.",
                start: 9,
                end: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B10- المكافئات التشجيعية : وهي بقيمة ( 500 دولار ) وتصرف لمن يشارك في رحلات العمل الخارجية فقط ولا تستبدل بالقيمة المالية والهدف منها الانتشار وبناء فرق جديدة خارج حدود فلسطين .",
              start: 10,
              end: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const AnimatedDescriptionText(
              text:
                  "\u202B11- نظام احتساب المكافئات : يتم احتساب الشهر كما هو مذكور في البند رقم 8 ويتم تحقيقها بأحد ثلاث طرق فقط .",
              start: 10,
              end: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                  start: 9,
                  end: 12,
                  text:
                      'ا . تسجيل 50 منتسب جديد خلال الشهر، ويضاف 5 دولارات على كل منتسب اضافي عن العدد المذكور في نفس الشهر.'),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                  start: 9,
                  end: 12,
                  text: 'ب . تسجيل 60 منتسب جديد خلال شهرين متتاليين .'),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                  start: 9,
                  end: 12,
                  text: 'ج . تسجيل 75 منتسب جديد خلال 3 شهور متتالية .'),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AnimatedDescriptionText(
                  start: 9,
                  end: 12,
                  text:
                      'د. لا يحقق للعضو المطالبة بالمكافئات في حال لم يحقق التسجيلات المذكورة في النقاط السابقة بالكميات والمدة المحددة فقط.'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'اوافق على الشروط',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                const SizedBox(width: 5.0),
                Checkbox(
                  value: _isChecked,
                  onChanged: _onCheckedChanged,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isChecked ? _onNextPressed : null,
              child: const Text('التالي'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    Key? key,
    required this.start,
    required this.end,
    required this.text,
  }) : super(key: key);

  final double start;
  final double end;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black,
                wordSpacing: 2,
                fontSize: value, // Animating font size from start to end
              ),
        );
      },
    );
  }
}
