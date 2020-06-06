import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final imgpath;
  CustomImage(this.imgpath);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/$imgpath'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
