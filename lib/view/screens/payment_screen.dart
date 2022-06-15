import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/2.2 theme.dart';
import '../widgets/payment/delivery_container_widget.dart';
import '../widgets/payment/payment_method_widget.dart';
import '../widgets/text_utils.dart';

class PayMentScreen extends StatelessWidget {
  const PayMentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("PayMent"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: "Shipping to",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(height: 20),
              const DeliveryContainerWidget(),
              const SizedBox(height: 20),
              TextUtils(
                text: "Payment method",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(height: 20),
              const PaymentMethodWidget(),
              const SizedBox(height: 30),
              Center(
                child: TextUtils(
                  text: "Total 200\$",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    )),
              ),
              //Total Buttom(),
            ],
          ),
        ),
      ),
    );
  }
}
