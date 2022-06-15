import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key, required this.outerBorder, required this.color})
      : super(key: key);
  final bool outerBorder;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: outerBorder ? Border.all(color: white, width: 2) : null),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
