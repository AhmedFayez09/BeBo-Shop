import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  const ContainerUnder(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.texttype})
      : super(key: key);

  final String text;
  final String texttype;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration:  BoxDecoration(
        color:Get.isDarkMode ? pinkClr :  mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: white,
              underline: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                text: texttype,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: white,
                underline: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
