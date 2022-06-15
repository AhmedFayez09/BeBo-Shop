import 'package:final_project_3/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_details/add_cart.dart';
import '../widgets/product_details/clothes_info.dart';
import '../widgets/product_details/image_silders.dart';
import '../widgets/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModel.image,),
              ClothesInfo(
                title: productModel.title,
                productId: productModel.id,
                rate: productModel.rating.rate,
                description: productModel.description,
              ),
               const SizeList(),
              AddCart(
                price: productModel.price,
                productModel: productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
