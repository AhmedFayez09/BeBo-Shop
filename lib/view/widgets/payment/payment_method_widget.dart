import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  @override
  int radioPaymentIndex = 1;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              name: "PayPal",
              image: "assets/images/paypal.png",
              scale: 0.7,
              value: 1,
              onChanged: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(height: 10),
          buildRadioPayment(
              name: "Google Pay",
              image: "assets/images/google.png",
              scale: 0.8,
              value: 2,
              onChanged: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(height: 10),
          buildRadioPayment(
              name: "PayPal",
              image: "assets/images/credit.png",
              scale: 0.7,
              value: 3,
              onChanged: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChanged,
  }) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),),

      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Image.asset(
              image,
              scale: scale,
            ),
            const SizedBox(width: 10),
            TextUtils(
              text: name,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              underline: TextDecoration.none,
            ),
          ],
        ),
        Radio(
          value: value,
          fillColor: MaterialStateProperty.resolveWith((states) => Get.isDarkMode ? pinkClr: mainColor),
          groupValue: radioPaymentIndex,
          onChanged: (int? value) {
            onChanged(value);
          },
        ),
      ]),
    );
  }
}
