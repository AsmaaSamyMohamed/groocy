
import "package:flutter/material.dart";
class TextWidget extends StatelessWidget {
   TextWidget({Key? key,
    required this.title,
    required this.color,
    this.isTitle=false,
    required this.textSize}) : super(key: key);

  final String title;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLines =10;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        maxLines: maxLines,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontWeight:isTitle ? FontWeight.bold :FontWeight.normal,
          fontSize: textSize,
        ));
  }
}
