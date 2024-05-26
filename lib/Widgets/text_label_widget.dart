import 'package:flutter/material.dart';
import 'package:trip/Widgets/text_widget.dart';

class TextLabelWidget extends StatelessWidget {
  final String text; 
  const TextLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 TextWidget(text: text,
                 
                 fontWeight: FontWeight.bold, fontFamily: 'playfair',), 
                 const Spacer(),

                 RichText(text: const TextSpan(
                  text: "Show all", 
                  style: TextStyle(
                    decoration: TextDecoration.underline, 
                    decorationThickness: 2
                  )
                 )), 

                 const SizedBox(
                  width: 2,
                 )

              ],
            );
  }
}