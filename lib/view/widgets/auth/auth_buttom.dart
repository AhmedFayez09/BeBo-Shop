
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class Auth_Buttom extends StatelessWidget {
  const Auth_Buttom({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode ?pinkClr :  mainColor,
          minimumSize: const Size(350, 50),
        ),
        child: TextUtils(
            text: text,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
            underline: TextDecoration.none));
  }
}
