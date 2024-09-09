import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/PaymentPages/pyamentMethod.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: Icon(Icons.arrow_back_ios_sharp,
                            color: UltColor.grey1),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.22),
                      Text(
                        "Payment",
                        style: TextStyle(
                            color: UltColor.purpel,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: const TextField(
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      hintText: 'Name', // Optional hint text
                      hintStyle: TextStyle(
                          color: Colors
                              .grey), // White hint color with some opacity
                      filled:
                          true, // This is important to apply a background color
                      fillColor:
                          Colors.white, // Background color for the TextField
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Circular border radius
                        borderSide:
                            BorderSide(color: Colors.transparent), // No border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Circular border radius
                        borderSide: BorderSide(
                            color:
                                Colors.transparent), // No border when focused
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: const TextField(
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      hintText: 'Phone Number', // Optional hint text
                      hintStyle: TextStyle(
                          color: Colors
                              .grey), // White hint color with some opacity
                      filled:
                          true, // This is important to apply a background color
                      fillColor:
                          Colors.white, // Background color for the TextField
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Circular border radius
                        borderSide:
                            BorderSide(color: Colors.transparent), // No border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Circular border radius
                        borderSide: BorderSide(
                            color:
                                Colors.transparent), // No border when focused
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: const TextField(
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      hintText: 'Email', // Optional hint text
                      hintStyle: TextStyle(
                          color: Colors
                              .grey), // White hint color with some opacity
                      filled:
                          true, // This is important to apply a background color
                      fillColor:
                          Colors.white, // Background color for the TextField
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Circular border radius
                        borderSide:
                            BorderSide(color: Colors.transparent), // No border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Circular border radius
                        borderSide: BorderSide(
                            color:
                                Colors.transparent), // No border when focused
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: const TextField(
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      hintText: 'Town/City', // Optional hint text
                      hintStyle: TextStyle(
                          color: Colors
                              .grey), // White hint color with some opacity
                      filled:
                          true, // This is important to apply a background color
                      fillColor:
                          Colors.white, // Background color for the TextField
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Circular border radius
                        borderSide:
                            BorderSide(color: Colors.transparent), // No border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Circular border radius
                        borderSide: BorderSide(
                            color:
                                Colors.transparent), // No border when focused
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: const TextField(
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      hintText: 'Adress', // Optional hint text
                      hintStyle: TextStyle(
                          color: Colors
                              .grey), // White hint color with some opacity
                      filled:
                          true, // This is important to apply a background color
                      fillColor:
                          Colors.white, // Background color for the TextField
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Circular border radius
                        borderSide:
                            BorderSide(color: Colors.transparent), // No border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Circular border radius
                        borderSide: BorderSide(
                            color:
                                Colors.transparent), // No border when focused
                      ),
                    ),
                  ),
                ),
                Container(
                    color: UltColor.grey2,
                    height: MediaQuery.of(context).size.height * 0.003),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: const TextField(
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      hintText:
                          'Special Instructions About Adress', // Optional hint text
                      hintStyle: TextStyle(
                          color: Colors
                              .grey), // White hint color with some opacity
                      filled:
                          true, // This is important to apply a background color
                      fillColor:
                          Colors.white, // Background color for the TextField
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Circular border radius
                        borderSide:
                            BorderSide(color: Colors.transparent), // No border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Circular border radius
                        borderSide: BorderSide(
                            color:
                                Colors.transparent), // No border when focused
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    // Your onPressed function here
                    // Get.to(Payment());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    backgroundColor: UltColor.pink1,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Adjust the border radius
                    ),
                  ),
                  child: Text(
                    'Use My Location',
                    style: TextStyle(
                        color: UltColor.purpel,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    // Your onPressed function here
                    Get.to(PaymentMethod());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 50),
                    backgroundColor: UltColor.purpel,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Adjust the border radius
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Image.asset(
                  "assets/images/paymentImage.png",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
