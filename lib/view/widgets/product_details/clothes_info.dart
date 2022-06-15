import 'package:final_project_3/logic/binding/main_binging.dart';
import 'package:final_project_3/logic/controller/product_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:final_project_3/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description})
      : super(key: key);
  final String title;
  final controller = Get.find<ProductController>();
  final int productId;
  final double rate;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? white : Colors.black,
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  margin: const EdgeInsetsDirectional.only(start: 50),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavouriates(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: rate.toString(),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),

              // this is package dont support null safety

              // RatingBar(
              //   rating: rate,
              //   icon: Icon(
              //     Icons.start,
              //     size: 20,
              //     color: Colors.grey,
              //   ),
              //   starCount: 5,
              //   spacing: 1,
              //   size: 20,
              //   isIndicator: false,
              //   allowHalfRating: true,
              //   onRatingCallback: (value, isIndicator) {
              //     isIndicator.value = true;
              //   },
              //   color: Colors.orange,
              // ),


              
              // this pakage support null safety
              RatingBar.builder(
                minRating: 1,
                initialRating: rate,
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  );
                },
                onRatingUpdate: (rating) {
                  rating = rate;
                },
                 glow: false,
                updateOnDrag: true,
                itemSize: 20,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ReadMoreText(
            trimMode :TrimMode.Line,
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",

            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr.withOpacity(0.6) : mainColor.withOpacity(0.3),
              
            ),
            moreStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
              
            ) ,
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? white : Colors.black,
              
            ),
          ),
        ],
      ),
    );
  }
}
