import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants/utils/colors.dart';

class ContainerController extends GetxController {
  // Variable to hold the index of the selected container
  var selectedIndex = (-1).obs;

  // Method to update the selected index
  void selectContainer(int index) {
    selectedIndex.value = index;
  }
}

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final ContainerController controller = Get.put(ContainerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Row(
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Payment Method",
                  style: TextStyle(
                      color: UltColor.purpel,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.selectContainer(0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: controller.selectedIndex.value == 0
                                  ? Colors.purple
                                  : Colors.transparent,
                              width: 3,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            "Credit Card",
                            style:
                                TextStyle(fontSize: 15, color: UltColor.purpel),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
