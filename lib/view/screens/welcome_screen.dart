import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utils/2.2 theme.dart';
import '../widgets/text_utils.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: TextUtils(
                        underline: TextDecoration.none,
                        text: 'Welcome',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                          underline: TextDecoration.none,
                          text: 'BeBo ',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                        TextUtils(
                          underline: TextDecoration.none,
                          text: 'Shop',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Get.offNamed(Routes.LoginScreen);
                    },
                    child: const TextUtils(
                      underline: TextDecoration.none,
                      text: 'Get Start',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils(
                        underline: TextDecoration.none,
                        text: "Don't have an Account ",
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: white,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.SginUpScreen);
                          },
                          child: const TextUtils(
                              underline: TextDecoration.underline,
                              text: 'Sign in',
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: mainColor))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
