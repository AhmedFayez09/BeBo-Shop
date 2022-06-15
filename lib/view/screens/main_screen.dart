import 'package:badges/badges.dart';
import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:final_project_3/logic/controller/main_controller.dart';
import 'package:final_project_3/routes/routes.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartcontroller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
              leading: Container(),
              actions: [
                //quantity
                Obx(() {
                  return Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartcontroller.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartscreen);
                      },
                      icon: Image.asset('assets/images/shop.png'),
                    ),
                  );
                })
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : white,
              currentIndex: controller.currentIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? white : Colors.black,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? white : Colors.black,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? white : Colors.black,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? white : Colors.black,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
