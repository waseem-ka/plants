import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/PaymentPages/payment.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 215.w,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: BoxDecoration(
                    color: UltColor.pink1,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(250))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 60.0, right: 0.0, left: 20),
                  child: Image.asset("assets/images/paymetImage.png"),
                ),
              ),
            ),
            Positioned(
                top: 95,
                left: 15,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                    color: UltColor.grey1,
                  ),
                )),
            Positioned(
              top: 90,
              left: 70,
              child: Text(
                "My Cart",
                style: TextStyle(
                    color: UltColor.purpel,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 70.0, top: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: UltColor.blue),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: UltColor.blue),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      color: UltColor.purpel,
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.003,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Address: Dummar street A bulding \nnumber 25',
                      style: TextStyle(
                          color: UltColor.grey1,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                UltColor.pink3)),
                        onPressed: () {},
                        child: Text(
                          "Change Address",
                          style:
                              TextStyle(fontSize: 15, color: UltColor.purpel),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Expected Date:  june/26/2024',
                      style: TextStyle(
                          color: UltColor.grey1,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Expected Time: 2:30 PM',
                      style: TextStyle(
                          color: UltColor.grey1,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                UltColor.pink3)),
                        onPressed: () {},
                        child: Text(
                          "Schedule Send Time",
                          style:
                              TextStyle(fontSize: 15, color: UltColor.purpel),
                        )),
                    Text(
                      "Delivery: 20\$",
                      style: TextStyle(
                        color: UltColor.grey1,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Taxes: 15\$",
                      style: TextStyle(
                        color: UltColor.grey1,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Your onPressed function here
                          Get.to(Payment());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          backgroundColor: UltColor.pink1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the border radius
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: UltColor.purpel,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
