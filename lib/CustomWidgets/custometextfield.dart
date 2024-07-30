import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final  String hinttext;
  final TextEditingController? controller;

  const CustomTextField({
    Key?key,
    required this.hinttext,
    required this.controller
  }):super(key:key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style:TextStyle(color: Colors.white),
     // obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        fillColor: Colors.white10,
        filled:true,
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
