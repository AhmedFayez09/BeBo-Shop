// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:final_project_3/model/product_models.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({
    Key? key,
    required this.productModel, required this.index, required this.quantity,
  }) : super(key: key);
  final ProductModel productModel;
  final int index;
  final controller = Get.find<CartController>();
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(
              left: 15,
            ),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productModel.image),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 productModel.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductFromCart(productModel);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? white : Colors.black,
                    ),
                  ),
                  Text(
                    "${quantity}",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModel);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModel);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Get.isDarkMode ? white : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
