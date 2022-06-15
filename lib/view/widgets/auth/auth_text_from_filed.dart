import 'package:final_project_3/utils/2.2%20theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AuthTextFromFiled extends StatelessWidget {
  const AuthTextFromFiled(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefix,
      required this.suffix,
      required this.hintText})
      : super(key: key);
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefix;
  final Widget suffix;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      cursorWidth: 2,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefix: prefix,
        suffix: suffix,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
         borderSide: const BorderSide(
           color: white,
         ),
         borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
         borderSide: const BorderSide(
           color: white,
         ),
         borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
         borderSide: const BorderSide(
           color: white,
         ),
         borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
         borderSide: const BorderSide(
           color: white,
         ),
         borderRadius: BorderRadius.circular(10),
        ),

      ),
    );
  }
}
