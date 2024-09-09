import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants/service/serviceApi.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/myWidget.dart';
import 'package:plants/view/loginPage/verification.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService authService = Get.find<AuthService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final Rx<File?> selectedProfilePhoto = Rx<File?>(null);
  final Rx<File?> selectedCertificate = Rx<File?>(null);

  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UltColor.blue,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomMyClipper(),
              child: Container(
                height: ScreenUtil().setHeight(300),
                color: UltColor.pink1,
              ),
            ),
            Positioned(
              top: 85.w,
              left: 30.w,
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: UltColor.grey1,
                size: 30.w,
              ),
            ),
            Positioned(
                left: 180.w,
                top: -20.w,
                child: Image.asset('assets/images/flower.png')),
            Positioned(
                left: 150.w,
                top: 85.w,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32.sp, color: UltColor.purpel),
                )),
            Positioned(
              left: 160.w,
              top: 175.w,
              child: CircleAvatar(
                radius: 55.w,
                backgroundColor: UltColor.grey2,
                backgroundImage: selectedProfilePhoto.value != null
                    ? FileImage(selectedProfilePhoto.value!)
                    : null,
                child: selectedProfilePhoto.value == null
                    ? Icon(
                        size: 50.w,
                        Icons.person,
                        color: Colors.grey,
                      ) // Placeholder if no image is selected
                    : null,
              ),
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 290.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Obx(() => TextButton(
                              onPressed: () async {
                                selectedProfilePhoto.value =
                                    await authService.pickImage();
                              },
                              child: Text(
                                'Select Profile Photo',
                                style: TextStyle(
                                    color: UltColor.grey1, fontSize: 15.sp),
                              ),
                            )),
                      ),
                      //Email TextFild
                      SizedBox(
                        width: ScreenUtil().setWidth(275),
                        height: ScreenUtil().setHeight(50),
                        child: TextField(
                          controller: emailController,
                          style: const TextStyle(
                              color: Colors.black), // Text color
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // Background color
                            labelStyle: TextStyle(
                                color: Color(0xFF8C8A8C)), // Label text color
                            labelText: 'Email',
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

                      //phone Number

                      SizedBox(
                        width: ScreenUtil().setWidth(275),
                        height: ScreenUtil().setHeight(50),
                        child: TextField(
                          controller: phoneNumberController,
                          style: const TextStyle(
                              color: Colors.black), // Text color
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // Background color
                            labelStyle: TextStyle(
                                color: Color(0xFF8C8A8C)), // Label text color
                            labelText: 'Phone Number',
                            hintText: '09********',
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

                      //user Name
                      SizedBox(
                        width: ScreenUtil().setWidth(275),
                        height: ScreenUtil().setHeight(50),
                        child: TextField(
                          controller: usernameController,
                          style: const TextStyle(
                              color: Colors.black), // Text color
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // Background color
                            labelStyle: TextStyle(
                                color: Color(0xFF8C8A8C)), // Label text color
                            hintText: 'User Name',
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
                      //Password
                      SizedBox(
                        width: ScreenUtil().setWidth(275),
                        height: ScreenUtil().setHeight(50),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.black), // Text color
                          decoration: const InputDecoration(
                            filled: true,

                            fillColor: Colors.white, // Background color
                            labelStyle: TextStyle(
                                color: Color(0xFF8C8A8C)), // Label text color
                            hintText: "Password",

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

                      //RePassword
                      SizedBox(
                        width: ScreenUtil().setWidth(275),
                        height: ScreenUtil().setHeight(50),
                        child: TextField(
                          controller: passwordConfirmationController,
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.black), // Text color
                          decoration: const InputDecoration(
                            filled: true,

                            fillColor: Colors.white, // Background color
                            labelStyle: TextStyle(
                                color: Color(0xFF8C8A8C)), // Label text color
                            hintText: 'Re Password',
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
                      //Pdf
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6)),
                          width: ScreenUtil().setWidth(275),
                          height: ScreenUtil().setHeight(50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                            ),
                            onPressed: () async {
                              selectedCertificate.value =
                                  await authService.pickFile();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedCertificate.value != null
                                      ? 'PDF Selected'
                                      : 'Upload PDF',
                                  style: TextStyle(
                                      color: UltColor.purpel, fontSize: 16.sp),
                                ),
                                Image.asset(
                                  'assets/images/pdf-icon.png',
                                  width: ScreenUtil().setWidth(33),
                                  height: ScreenUtil().setHeight(33),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Sign Up buttom
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Obx(() {
                          return isLoading.value
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () async {
                                    isLoading.value = true;
                                    if (selectedProfilePhoto.value != null &&
                                        selectedCertificate.value != null) {
                                      await authService.signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        username: usernameController.text,
                                        profilePhoto:
                                            selectedProfilePhoto.value!,
                                        certificate: selectedCertificate.value!,
                                        phoneNumber: phoneNumberController.text,
                                        passwordConfirmation:
                                            passwordConfirmationController.text,
                                      );
                                    } else {
                                      Get.snackbar("Error",
                                          "Please select profile photo and certificate.");
                                    }
                                    isLoading.value = false;
                                  },
                                  child: Text('Sign Up'),
                                );
                        }),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle sign up
                                Get.to(const Verification());
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: UltColor.purpel,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: UltColor.purpel,
                        width: ScreenUtil().setWidth(244),
                        height: ScreenUtil().setHeight(1.2),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
