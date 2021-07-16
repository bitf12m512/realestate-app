import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double letterspacing;
  final double height;
  final TextAlign alignemnt;
  const CustomText({
    this.text="",
    this.color=Colors.black,
    this.size=20,
    this.fontWeight=FontWeight.w400,
    this.letterspacing=0.6,
    this.height=1,
    this.alignemnt=TextAlign.left
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textAlign: alignemnt,
      style: TextStyle(
          color: color,
          fontSize: size,
          letterSpacing: letterspacing,
          height: height,
          fontWeight: fontWeight),
    );
  }
}