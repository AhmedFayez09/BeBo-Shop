import 'package:final_project_3/model/product_models.dart';
import 'package:final_project_3/services/category_services.dart';
import 'package:final_project_3/view/screens/categary_scerrn.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var categoryList = <ProductModel>[].obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    getcategorys();
  }

  void getcategorys() async {
    var categotryName = await CategoryServices.getcategory();

    try {
      isCategoryLoading(true);
      if (categotryName.isNotEmpty) {
        categoryNameList.addAll(categotryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

   getAllCategorys(String namecategory) async {
    isAllCategory(true);
    categoryList.value = await AllCategoryServises.getAllCategory(namecategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categotryAllName = await getAllCategorys(categoryNameList[index]);
       
    if (categotryAllName != null) {
      categoryList.value = categotryAllName;
    }
  }
}
