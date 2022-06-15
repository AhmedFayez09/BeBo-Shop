import 'package:final_project_3/logic/controller/category_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.categoryNameList.isEmpty
              ? Get.isDarkMode
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: pinkClr,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.getCategoryIndex(index);
                        Get.to(() => CategoryItems(
                          categoryTitle: controller.categoryNameList[index],
                        ));
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image:
                                  NetworkImage(controller.imageCategory[index]),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              controller.categoryNameList[index],
                              style: const TextStyle(
                                backgroundColor: Colors.black38,
                                color: white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: controller.categoryNameList.length,
                ),
        );
      }
    });
  }
}

/** Obx(() {
      if (controller.isCategoryLoading.value ) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => CategoryItems());
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    image:  DecorationImage(
                        image: NetworkImage(

                        controller.imageCategory[index]
                        ),
                        fit: BoxFit.cover),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryNameList[index],
                        style: const TextStyle(
                          backgroundColor: Colors.black38,
                          color: white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: controller.categoryNameList.length,
          ),
        );
      }
    }); */
