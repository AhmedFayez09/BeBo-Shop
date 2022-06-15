import 'package:final_project_3/model/product_models.dart';
import 'package:final_project_3/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favouritesList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

// this is varibles with search logic
  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    List? storedList = stoarge.read<List>("isFavouritesList");
    if (storedList != null) {
      favouritesList =
          storedList.map((e) => ProductModel.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

//logic for Favourites  screen

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await stoarge.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await stoarge.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavouriates(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

//Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();


    update();
  }

  void clearSearchList() {
    searchTextController.clear();
    addSearchToList("");
  }
}
