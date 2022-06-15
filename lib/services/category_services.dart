import 'package:http/http.dart' as http;

import '../model/category_model.dart';

import '../model/product_models.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getcategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
  
}

class AllCategoryServises{


static Future <List<ProductModel>> getAllCategory(String categoryNames) async  {

 var response = await  http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

if(response.statusCode == 200){
  var jsonData =      response.body;
  return  productModelFromJson(jsonData);
}else{
  return  throw Exception("Failed to load product");
}

}

}