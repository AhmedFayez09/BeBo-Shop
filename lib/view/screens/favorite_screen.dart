import 'package:final_project_3/logic/controller/product_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favouritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Please Add your favorites products..',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Get.isDarkMode ? white : Colors.black,
                  ),
                )
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildFavorateItem(
                image: controller.favouritesList[index].image,
                price: controller.favouritesList[index].price,
                title: controller.favouritesList[index].title,
                productId:  controller.favouritesList[index].id,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Get.isDarkMode ? white : Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favouritesList.length,
          );
        }
      }),
    );
  }

  Widget buildFavorateItem({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Get.isDarkMode ? white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(width: 10),
                Text(
                  '\$ price',
                  style: TextStyle(
                      color: Get.isDarkMode ? white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              controller.manageFavourites(productId);
            },
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: Get.isDarkMode ? white : Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
