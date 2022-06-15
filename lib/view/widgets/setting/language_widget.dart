import 'package:final_project_3/logic/controller/setting_controller.dart';
import 'package:final_project_3/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/2.2 theme.dart';
import '../text_utils.dart';

class LonguageWidget extends StatelessWidget {
   LonguageWidget({Key? key}) : super(key: key);
final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_){
return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: languageSettings,
                ),
                child: const Icon(
                  Icons.language,
                  color: white,
                ),
              ),
              const SizedBox(width: 20),
              TextUtils(
                text: "Language".tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? white : Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              width: 2,
              color: Get.isDarkMode ? white : Colors.black,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? white : Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  value: ene,
                  child: Row(
                    children: [
                      const Text(
                        'English',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        english,
                        width: 20,
                        height: 23,
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: ara,
                  child: Row(
                    children: [
                      const Text(
                        'العربية',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        arabic,
                        width: 23,
                        height: 23,
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: frf,
                  child: Row(
                    children: [
                      const Text(
                        'Franch',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        franch,
                        width: 23,
                        height: 23,
                      ),
                    ],
                  ),
                ),
              ],
              value: controller.langLocal,
              onChanged: (value) {
               controller.changeLanguage(value!);
               Get.updateLocale(Locale(value));
              },
            ),
          ),
        ),
      ],
    );
    });
  }
}
