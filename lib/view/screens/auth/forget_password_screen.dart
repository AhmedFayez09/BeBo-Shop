import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../utils/2.2 theme.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_buttom.dart';
import '../../widgets/auth/auth_text_from_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : const Color.fromARGB(15, 255, 255, 255),
          centerTitle: true,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ?pinkClr  :  mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ?  white  : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon:  Icon(
                        Icons.close_rounded,
                        color: Get.isDarkMode ?  white  : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover your account , then please provide your email ID below... ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ?  white:Colors.black  ,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 300,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromFiled(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invaild Email';
                      } else {
                        return null;
                      }
                    },
                    prefix: Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          ),
                    suffix: const Text(""),
                    hintText: ' Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return Auth_Buttom(
                      text: 'SIND',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email);
                       } 
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
