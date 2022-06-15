import 'package:flutter/cupertino.dart';

class test extends StatefulWidget {
  test({Key? key, required this.email, required this.name}) : super(key: key);
  String? name;
  String? email;
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name!),
    );
  }
}
