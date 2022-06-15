
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/2.2 theme.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_buttom.dart';
import '../../widgets/auth/auth_text_from_filed.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final fromkey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // How to convert to Darkmode in Getx Package

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
                                text: 'LOG ',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? pinkClr :  mainColor,
                                underline: TextDecoration.none),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: 'IN',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ?  white  :Colors.black ,
                                underline: TextDecoration.none),
                          ],
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
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromFiled(
                              controller: passController,
                              obscureText:
                                  controller.isVisibitlty ? false : true,
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
                                    //AuthController.isVisibitlty
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
                              hintText: ' Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetpasswordscreen);
                            },
                            child: TextUtils(
                              text: 'Forget Password',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Get.isDarkMode ? white :  Colors.black,
                              underline: TextDecoration.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const SizedBox(height: 50),
                        GetBuilder<AuthController>(builder: (_) {
                          return Auth_Buttom(
                            text: 'LOG IN',
                            onPressed: () {
                              if (fromkey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passController.text;
                                controller.logInUsingFirsbase(
                                    email: email, password: password);
                              }
                            },
                          );
                        }),
                        const SizedBox(height: 20),
                        TextUtils(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.black : white,
                          underline: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                //controller.facebookSignUpApp();
                              //  controller.facebookSignUpApp();
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode ?pinkClr :  Color.fromARGB(15, 0, 0, 0),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child:
                                    Image.asset('assets/images/facebook.png'),
                              ),
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSignUpApp();
                                },
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Get.isDarkMode ? pinkClr :  Color.fromARGB(15, 0, 0, 0),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child:
                                      Image.asset('assets/images/google.png'),
                                ),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.SginUpScreen);
                },
                text: " Don't have an Account?",
                texttype: ' Sign up ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
