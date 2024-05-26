import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final double height;
  const BarChartWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
                offset: const Offset(0, 23),
                 child: Container(
                  height: height, 
                  width: 10, 
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(3)
                  ),
                               ),
               );
  }
}