import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/2.2 theme.dart';
import '../text_utils.dart';
class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.chechBox();
            },
            child: Container(
              height: 35, 
              width: 35,
              
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: 
              controller.isChechBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : const Icon(
                          Icons.done,
                          color: pinkClr,
                          size: 30,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                text: 'I accept ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? white :  Colors.black,
                underline: TextDecoration.none,
              ),
              TextUtils(
                text: 'term & conditions',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                 color: Get.isDarkMode ? white :  Colors.black,
                underline: TextDecoration.underline,
              )
            ],
          ),
        ],
      );
 
    });
  }
}