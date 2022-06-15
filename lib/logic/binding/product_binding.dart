import 'package:final_project_3/logic/controller/cart_controller.dart';
import 'package:final_project_3/logic/controller/category_controller.dart';
import 'package:final_project_3/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }

}