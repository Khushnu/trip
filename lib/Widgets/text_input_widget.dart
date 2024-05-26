import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final TextEditingController? controller; 
  final String hintText; 
  final String? prefixicon; 
  final double? scale;
  final bool isIcon;
  const TextInputWidget({super.key, this.controller, required this.hintText, this.prefixicon, this.scale, this.isIcon = true});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10,),
            hintText: widget.hintText, 
            prefixIcon: widget.isIcon ? Image.asset(widget.prefixicon ?? 'Images/search.png', scale: widget.scale ?? 1.6, color: Colors.white,) : null,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)), 
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
            ), 
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.7)),
          ), 
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.withOpacity(0.7)),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.withOpacity(0.7)),
          ),
        ));
  }
}