import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/cart/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cart/card_total.dart';
import '../widgets/cart/cart_product.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text("Cart Item"),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                onPressed: () {
                  controller.clearAllProducts();
                },
                icon: const Icon(Icons.backspace_sharp),
              ),
            ],
          ),
          body: Obx(() {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 670,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              // this is normal
                              // but is well wrong
                              //  productModel: controller.productsMap[index],
                              // this is becouse the productMap inside it keys inside the keys list
                              productModel:
                                  controller.productsMap.keys.toList()[index],
                              index: index,
                              quantity:
                                  controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.productsMap.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CardTotal(),
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
