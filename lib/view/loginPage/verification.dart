import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/controllers/Authentication.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String email = Get.arguments;
  final TextEditingController codeController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(415),
                  decoration: BoxDecoration(
                      color: UltColor.blue,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90))),
                  child: Image.asset("assets/images/Monstera.png"),
                ),
              ],
            ),
            Positioned(
              top: 120,
              left: 20,
              child: IconButton(
                  iconSize: 30,
                  color: UltColor.grey1,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 410.w),
                child: Column(
                  children: [
                    Text(
                      "Verification Code",
                      style: TextStyle(fontSize: 32.sp, color: UltColor.grey1),
                    ),
                    Text(
                      "Pleas enter verification code sent to \n$email \nValid to 10 minuts",
                      style: TextStyle(color: UltColor.grey1, fontSize: 20.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle sign up
                        // Get.to(const Verification());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 200.0.w),
                        child: Text(
                          'Re send code',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: UltColor.purpel,
                          ),
                        ),
                      ),
                    ),
                    _pinInputForm(),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _pinInputForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Pinput(
              length: 6,
              controller: codeController,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Text(
                "Verification code consists of \nnumbers and letters ",
                style: TextStyle(color: UltColor.grey1, fontSize: 16.sp),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(() {
                return authController.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          // Send email and 2FA code to confirm 2FA
                          authController.confirm2FACode(
                              email, codeController.text.trim());
                        },
                        child: Text('Verify'),
                      );
              }),
            ),
          ],
        ));
  }
}
