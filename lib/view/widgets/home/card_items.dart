import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:final_project_3/logic/controller/product_controller.dart';
import 'package:final_project_3/main.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/screens/product_detailes_screen.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_models.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: controller.searchList.isEmpty &&
                    controller.searchTextController.text.isNotEmpty
                ? Get.isDarkMode
                    ? Image.asset('assets/images/search_empty_dark.png')
                    : Image.asset('assets/images/search_empry_light.png')
                : GridView.builder(
                    itemCount: controller.searchList.isEmpty
                        ? controller.productList.length
                        : controller.searchList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 9.0,
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      if (controller.searchList.isEmpty) {
                        return buildCardItem(
                            image: controller.productList[index].image,
                            price: controller.productList[index].price,
                            rate: controller.productList[index].rating.rate,
                            productId: controller.productList[index].id,
                            productModel: controller.productList[index],
                            onTap: () {
                              Get.to(() => ProductDetailsScreen(
                                    productModel: controller.productList[index],
                                  ));
                            });
                      } else {
                        return buildCardItem(
                            image: controller.searchList[index].image,
                            price: controller.searchList[index].price,
                            rate: controller.searchList[index].rating.rate,
                            productId: controller.searchList[index].id,
                            productModel: controller.searchList[index],
                            onTap: () {
                              Get.to(() => ProductDetailsScreen(
                                    productModel: controller.searchList[index],
                                  ));
                            });
                      }
                    },
                  ), // image: controller.productList[index].image,
          );
        }
      },
    );
  }

  Widget buildCardItem({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModel productModel,
    required Function() onTap,
  }) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFavouriates(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModel);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Image.network(
                  image,
                  //  'https://images.unsplash.com/photo-1654349409781-75907b14026a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      " \$price ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 4,
                          right: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: "$rate",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: white,
                              underline: TextDecoration.none,
                            ),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/**Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 9.0,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return buildCardItem();
        },
      ),
    ); */