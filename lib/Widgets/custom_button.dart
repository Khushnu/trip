import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  final double screenHeight; 
  final double screenWidth; 
  final Color btnColor; 
  final Border? borside; 
  final BorderRadius? borderRadius;
  final Widget child;
  final Function()? ontap;
  const CustomButtonWidget({super.key, required this.screenHeight, required this.screenWidth, required this.btnColor, this.borside, this.borderRadius, required this.child, this.ontap});

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.ontap,
      child: Container(
                height: widget.screenHeight, 
                width: widget.screenWidth,
                decoration: BoxDecoration(
                  color: widget.btnColor, 
                  border: widget.borside,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(10)
                ),
                child: Center(
                  child: widget.child,
                ),
              ),
    );
  }
}