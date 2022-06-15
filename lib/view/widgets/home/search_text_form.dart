import 'package:final_project_3/logic/controller/product_controller.dart';
import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return TextField(
        controller: controller.searchTextController,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        cursorColor: Colors.black,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: white,
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearchList();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              : null,
          hintText: "Search with name or price",
          hintStyle: const TextStyle(
            color: Color.fromARGB(77, 0, 0, 0),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }
}
