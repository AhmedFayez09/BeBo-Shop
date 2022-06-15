import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:final_project_3/logic/controller/category_controller.dart';
import 'package:final_project_3/logic/controller/product_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/screens/product_detailes_screen.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/product_models.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.categoryTitle}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryContrpller = Get.find<CategoryController>();
  final String categoryTitle ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(// 
        title: Text(categoryTitle
         // categoryContrpller.categoryNameList[index],
         // "Category item"
        
        ),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx((){
      if(categoryContrpller.isAllCategory.value)
      {
        return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
      }else{
          return 
        GridView.builder(
        itemCount: categoryContrpller.categoryList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 9.0,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return buildCardItem(
              image:  categoryContrpller.categoryList[index].image,
              price:  categoryContrpller.categoryList[index].price,
              rate:  categoryContrpller.categoryList[index].rating.rate,
              productId:  categoryContrpller.categoryList[index].id,
              productModel:  categoryContrpller.categoryList[index],
              onTap: () {
                Get.to(() => ProductDetailsScreen(
                      productModel:  categoryContrpller.categoryList[index],
                    ));
              });
        },
      );
      }
      })
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
                        color: mainColor,
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
