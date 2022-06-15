import 'package:final_project_3/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/2.2 theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "Logout From App",
            titleStyle: const TextStyle(
              fontSize: 18,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logout',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
            radius: 10,
            textCancel: " NO ",
            cancelTextColor: Colors.black,
            textConfirm: " YES ",
            confirmTextColor: Colors.black,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOutFromApp();
            },
            buttonColor: white,
          );
        },
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        splashColor: Get.isDarkMode ? Colors.pink : mainColor.withOpacity(0.4),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.logout,
              color: white,
            ),
          ),
          const SizedBox(width: 20),
          TextUtils(
            text: "LogOut".tr,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? white : Colors.black,
            underline: TextDecoration.none,
          ),
        ]),
      ),
    );
    });
  }
}
