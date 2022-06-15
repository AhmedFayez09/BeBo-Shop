import 'package:final_project_3/model/product_models.dart';
import 'package:final_project_3/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/2.2 theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;

     
    } else {
      productsMap[productModel] = 1;
    }
  }

  void removeProductFromCart(ProductModel productModel) {
    if(productsMap.containsKey(productModel) && productsMap[productModel]==1){
productsMap.removeWhere((key, value) => key == productModel);
    }else{
productsMap[productModel] -= 1 ;
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
  

  Get.defaultDialog(
                  title: "Clean Products",
                  titleStyle: const TextStyle(
                    fontSize: 18,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                  middleText: 'Are you sure you need clear products',
                  middleTextStyle: TextStyle(
                    fontSize: 18,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  radius: 10,
                  textCancel: " NO ",
                  cancelTextColor: Colors.black,
                  textConfirm: " YES ",
                  confirmTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(Routes.cartscreen);
                    
                  },
                  onConfirm: () {
                   productsMap.clear(); 
                   Get.back(); 
                  },
                  buttonColor: white,
                );





  }


  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();

  get  total =>  productsMap.entries
          .map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
  
  

int quantity(){

if(productsMap.isEmpty)
{
  return 0;
}else {
return productsMap.entries.map((e) => e.value)
.toList().reduce((value, element) => value + element);
}

}







  }
