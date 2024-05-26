import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? colortext; 
  final String? fontFamily; 
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  const TextWidget({super.key, 
  required this.text, this.colortext, this.fontFamily, this.size, this.fontWeight, this.textAlign, this.textDecoration, this.textDecorationColor});

  @override
  Widget build(BuildContext context) {
    return   Text(text, 
    textAlign: textAlign,
    style:  TextStyle(
      color: colortext ?? Colors.white, fontFamily: fontFamily, 
      fontWeight: fontWeight ,
      decoration: textDecoration,
      decorationColor: textDecorationColor,
      fontSize: size ?? 15, ),);
  }
}