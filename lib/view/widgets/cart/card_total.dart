import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class CardTotal extends StatelessWidget {
   CardTotal({Key? key}) : super(key: key);
final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                text: "Total",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                underline: TextDecoration.none,
              ),
              Text(
                "\$${controller.total}",
                style: TextStyle(
                  color: Get.isDarkMode ? white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor
                ),
                onPressed: () {
                  Get.toNamed(Routes.paymentScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                     Text(
                      "Check Out",
                      style: TextStyle(fontSize: 20,color: white ),
                    ),
                     SizedBox(width: 10),
                    Icon(Icons.shopping_cart,size: 30,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    });
  }
}
