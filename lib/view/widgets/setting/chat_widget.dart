import 'package:final_project_3/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/2.2 theme.dart';
import '../text_utils.dart';

class ForContact extends StatelessWidget {
  const ForContact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Material(
        color: white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            launch("tel://024895");
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
                Icons.phone,
                color: white,
              ),
            ),
            const SizedBox(width: 20),
            TextUtils(
              text: "Contact us".tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? white :  Colors.black ,
              underline: TextDecoration.none,
            ),
          ]),
        ),
      );
    });
  }
}
