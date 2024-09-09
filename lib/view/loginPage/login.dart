import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants/controllers/Authentication.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/loginPage/signUp.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F6F6),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: ScreenUtil().setWidth(230),
                height: ScreenUtil().setHeight(200),
                decoration: const BoxDecoration(
                    color: Color(0xffF3E9F5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(500, 500))),
              ),
            ),
            // Top image
            Positioned(
                top: 30,
                right: 0,
                child: Image.asset(
                  'assets/images/topBackground.png',
                  width: ScreenUtil().setWidth(313),
                  height: ScreenUtil().setHeight(240),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 110.0, left: 80),
              child: Text(
                'Logo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: UltColor.purpel,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 80.w),
                width: ScreenUtil().setWidth(290),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10.w),
                    // Email TextField
                    SizedBox(
                      width: ScreenUtil().setWidth(275),
                      height: ScreenUtil().setHeight(50),
                      child: TextField(
                        controller: emailController,
                        style:
                            const TextStyle(color: Colors.black), // Text color
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Background color
                          labelStyle: TextStyle(
                              color: Color(0xFF8C8A8C)), // Label text color
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                              color: Color(0xFF8C8A8C)), // Hint text color
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Focused border color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    // Phone Number TextField
                    SizedBox(
                      width: ScreenUtil().setWidth(275),
                      height: ScreenUtil().setHeight(50),
                      child: const TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.black), // Text color
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Background color
                          labelStyle: TextStyle(
                              color: Color(0xFF8C8A8C)), // Label text color
                          hintText: 'Phone Number',

                          hintStyle: TextStyle(
                              color: Color(0xFF8C8A8C)), // Hint text color
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Focused border color
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password TextField
                    SizedBox(
                      width: ScreenUtil().setWidth(275),
                      height: ScreenUtil().setHeight(50),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style:
                            const TextStyle(color: Colors.black), // Text color
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Background color
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Color(0xFF8C8A8C)), // Hint text color
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Focused border color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(20)),
                    // Forgot Password and Signup
                    Center(
                      child: Text(
                        'Should be none less than 8 characters',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.0.w),
                      child: GestureDetector(
                        onTap: () {
                          // Handle forgot password
                        },
                        child: Text(
                          'Forget password?',
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        ),
                      ),
                    ),

                    SizedBox(height: ScreenUtil().setHeight(15)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 10.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle sign up
                              Get.to(() => SignUp());
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: UltColor.purpel,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: UltColor.purpel,
                      width: ScreenUtil().setWidth(166),
                      height: ScreenUtil().setHeight(1),
                    ),
                    const SizedBox(height: 20),
                    // Login Button

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Obx(() {
                        return authController.isLoading.value
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: UltColor.purpel),
                                onPressed: () {
                                  authController.login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: ScreenUtil().setWidth(180),
                height: ScreenUtil().setHeight(150),
                decoration: const BoxDecoration(
                    color: Color(0xffF3E9F5),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(500, 500))),
              ),
            ),
            // Top image
            Positioned(
                bottom: -34,
                left: -45,
                child: Image.asset(
                  'assets/images/bottomBackground.png',
                  width: ScreenUtil().setWidth(313),
                  height: ScreenUtil().setHeight(240),
                )),
          ],
        ),
      ),
    );
  }
}
