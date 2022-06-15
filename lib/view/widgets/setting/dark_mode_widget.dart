import 'package:final_project_3/logic/controller/setting_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../logic/controller/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
          activeTrackColor: Get.isDarkMode ?  pinkClr: mainColor,
          activeColor: Get.isDarkMode ?  pinkClr: mainColor,
          value: controller.switchValue.value,
          onChanged: (value) {
            ThemeController().changesTheme();
            controller.switchValue.value = value;
          },
        ),
      ],
    );
    });
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: Icon(
            Icons.dark_mode,
            color: white,
          ),
        ),
        SizedBox(width: 20),
        TextUtils(
          text: "Dark Mode".tr,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? white : Colors.black,
          underline: TextDecoration.none,
        ),
      ]),
    );
  }
}
