import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
var currentSeleceted = 0;

class _SizeListState extends State<SizeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: ((context, index) => const SizedBox(width: 10)),
        itemCount: sizeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSeleceted = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? currentSeleceted == index
                        ? pinkClr.withOpacity(0.4)
                        : Colors.black
                    : currentSeleceted == index
                        ? mainColor.withOpacity(0.4)
                        : white,
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                  color: Get.isDarkMode
                      ? currentSeleceted == index
                          ? white
                          : white
                      : currentSeleceted == index
                          ? Colors.black
                          : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
