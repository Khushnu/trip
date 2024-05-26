import 'package:flutter/material.dart';
import 'package:trip/Model/navbaritems.dart';
import 'package:trip/Widgets/custom_button.dart';

// ignore: must_be_immutable
class BottomNavBarWidget extends StatefulWidget {
   int index; 
   BottomNavBarWidget({super.key, required this.index});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
 void onTapped(int index) {
    setState(() {
      widget.index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
        height: screenHeight * 0.1 + 10  ,
        width: screenWidth,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        decoration:  BoxDecoration(
          color: const Color(0xff151718),
         border: Border(top: BorderSide(color: Colors.white.withOpacity(0.2)))
        
        ),
        child: 
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navbaritemsList.length, (index) {
                bool isSelected = index == widget.index;
                return InkWell(
                  onTap: () {
                    onTapped(index);
                  },
                  child: Image.asset(
                    navbaritemsList[index].image,
                    scale: 1.4,
                    color: isSelected
                         ? Colors.white
                        : Colors.white.withOpacity(0.3),
                  ),
                );
              })
                ..insert(
                    2,
                    const CustomButtonWidget(
                      screenHeight: 40,
                      screenWidth: 40, 
                      btnColor: Color(0xff282A2C), 
                      child: Icon(Icons.add, color: Colors.white,),
                    ))
                    ),
      );
  }
}