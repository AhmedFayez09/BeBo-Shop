import 'package:final_project_3/logic/controller/auth_controller.dart';
import 'package:final_project_3/logic/controller/setting_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authcontroller.disPlayUserPhoto.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: controller
                        .capitalize(authcontroller.displayUserName.value),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                  TextUtils(
                    text: authcontroller.displayUserEmail.value,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode ? white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ],
          );
        })
      ],
    );
  }
}
