import 'package:final_project_3/logic/binding/auth_binding.dart';
import 'package:final_project_3/view/widgets/auth/auth_buttom.dart';
import 'package:final_project_3/view/widgets/auth/check_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/2.2 theme.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_from_filed.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class SginUpScreen extends StatelessWidget {
  SginUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final fromkey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
         backgroundColor: Get.isDarkMode ?darkGreyClr  : white ,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromkey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: 'SGIN ',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ?pinkClr  :  mainColor,
                                underline: TextDecoration.none),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: 'UP',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? white :   Colors.black,
                                underline: TextDecoration.none),
                          ],
                        ),

                        const SizedBox(height: 50),

                        //AuthTextFromFiledForUserName,
                        AuthTextFromFiled(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefix: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : const Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffix: const Text(""),
                          hintText: ' User Name',
                        ),
                        const SizedBox(height: 20),

                        AuthTextFromFiled(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationEmail).hasMatch(value)) {
                              return 'Enter valid Email';
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
                        const SizedBox(height: 20),

                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromFiled(
                            controller: passController,
                            obscureText: controller.isVisibitlty ? true : false,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefix: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : const Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffix: IconButton(
                              icon: controller.isVisibitlty
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                              onPressed: () {
                                controller.visibility();
                              },
                            ),
                            hintText: ' password',
                          );
                        }),
                        const SizedBox(height: 50),
                        CheckWidget(),

                        const SizedBox(height: 50),

                        GetBuilder<AuthController>(builder: (_){
                          return Auth_Buttom(
                            text: 'SIGN UP',
                            onPressed: () 
                              
                            {
                              if (controller.isChechBox == false) {
                                Get.snackbar(
                                  "Check Box",
                                  "Please, Accept terms & conditions",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: white,
                                );
                              } else if (fromkey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passController.text;

                                controller.signUpUsingFirsbase(
                                  name: name,
                                  email: email,
                                  password: password,
                                );
                                controller.isChechBox = true;
                              }
                            },
                            );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.LoginScreen);
                },
                text: 'Already have an Account?',
                texttype: ' Log in ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
