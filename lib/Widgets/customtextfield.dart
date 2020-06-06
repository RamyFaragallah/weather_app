import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  Color color;
  Function fn;
  CustomTextField(this.color,this.fn);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        onSubmitted: fn,
          style: TextStyle(color: color, fontSize: 25),
      decoration: InputDecoration(
      hintText: 'Search location ....',
      hintStyle:
      TextStyle(color: color, fontSize: 18.0),
      prefixIcon: Icon(Icons.search, color: color),
      ),),
    );
  }
}
