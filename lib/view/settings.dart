import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants/service/serviceApi.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/PaymentPages/payment.dart';
import 'package:plants/view/profile.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find<AuthService>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
                color: UltColor.blue,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(103.sp))),
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: UltColor.purpel,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.575,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          TextButton(
                              onPressed: () {
                                Get.to(const profileScreen());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Account Information",
                                    style: TextStyle(
                                        color: UltColor.grey1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: UltColor.grey1,
                                  )
                                ],
                              )),
                          TextButton(
                              onPressed: () {
                                Get.to(const profileScreen());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "payment Methods",
                                    style: TextStyle(
                                        color: UltColor.grey1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: UltColor.grey1,
                                  )
                                ],
                              )),
                          TextButton(
                              onPressed: () {
                                Get.to(const Payment());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Order History",
                                    style: TextStyle(
                                        color: UltColor.grey1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: UltColor.grey1,
                                  )
                                ],
                              )),
                          TextButton(
                              onPressed: () {
                                Get.to(const profileScreen());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Language Sittings",
                                    style: TextStyle(
                                        color: UltColor.grey1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: UltColor.grey1,
                                  )
                                ],
                              )),
                          CustomTextFild("Legal Information", true),
                          CustomTextFild("About Us", true),
                          TextButton(
                              onPressed: () {
                                Get.to(const profileScreen());
                              },
                              child: TextButton(
                                  onPressed: () async {
                                    await authService
                                        .logout(); // Call the logout function
                                  },
                                  child: Text(
                                    "Log Out",
                                    style: TextStyle(
                                        color: UltColor.grey1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.425,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                          color: UltColor.pink2,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200.sp),
                              topLeft: Radius.circular(200.sp))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20), // Match the border radius with the container
                          child: Image.asset(
                            "assets/images/settings.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget CustomTextFild(String name, bool isIcon) {
    return TextButton(
        onPressed: () {
          Get.to(const profileScreen());
        },
        child: Row(
          children: [
            Text(
              "$name",
              style: TextStyle(
                  color: UltColor.grey1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            if (isIcon == true)
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: UltColor.grey1,
              )
          ],
        ));
  }
}
