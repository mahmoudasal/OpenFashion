import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    this.max = 1,
    this.height = 1,
    this.spacing = 1,
   
  });

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final int max;
  final double height;
  final double spacing;
  

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        fontFamily: "TenorSans",
        fontSize: size,
        letterSpacing: spacing,
        color: color,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis ,
        height: height,
      ),
    );
  }
}
