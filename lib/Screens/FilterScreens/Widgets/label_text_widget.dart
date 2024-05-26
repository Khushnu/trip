import 'package:flutter/material.dart';
import 'package:trip/Widgets/text_widget.dart';

class TextLabeelWidget extends StatelessWidget {
  final String text1; 
  final String text2;
  const TextLabeelWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SizedBox(height: 12,),
             TextWidget(text: text1 , size: 18, fontWeight: FontWeight.bold,),
            const SizedBox(height: 4,),
            TextWidget(text: text2 , size: 16, colortext: Colors.white.withOpacity(0.6),),
            const SizedBox(height: 12,),
      ],
    );
  }
}