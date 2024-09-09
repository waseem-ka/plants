import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants/controllers/product_controller.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/myWidget.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().setHeight(297),
              decoration: BoxDecoration(
                  color: UltColor.blue,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(83))),
              child: Column(
                children: [
                  SizedBox(height: ScreenUtil().setHeight(25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/home.png"),
                      Text(
                        "LOGO",
                        style:
                            TextStyle(color: UltColor.purpel, fontSize: 64.sp),
                      )
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: SearchBox(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "welcome here",
                style: TextStyle(
                    color: UltColor.purpel,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: [Text("Offers")],
              ),
            )
          ],
        ),
      )),
    );
  }
}
