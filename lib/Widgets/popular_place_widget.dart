import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trip/Model/populartripmodel.dart';
import 'package:trip/Widgets/custom_button.dart';
import 'package:trip/Widgets/text_widget.dart';

class PopularPlaceWidget extends StatefulWidget {
  const PopularPlaceWidget({super.key});

  @override
  State<PopularPlaceWidget> createState() => _PopularPlaceWidgetState();
}

class _PopularPlaceWidgetState extends State<PopularPlaceWidget> {
  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listPopularPlaces.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(14.0).copyWith(left: 0),
                      child: Container(
                        height:  screenHeight * 0.2 + 50, 
                        width:  screenWidth * 0.4, 
                       
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), 
                          gradient: LinearGradient(colors: [
                            Colors.black.withOpacity(0.5), 
                            Colors.black, 
                          ] ), 
                          image: DecorationImage(image: AssetImage(e.image, ), fit: BoxFit.fill)
                        ),
                        child: Stack(
                          children: [
                            Container(
                               height:screenHeight * 0.2 + 50, 
                              width:screenWidth * 0.4, 
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter, 
                                  end: Alignment.bottomCenter,
                                  colors: [
                                  Colors.black.withOpacity(0.2), 
                                  Colors.black.withOpacity(0.7), 
                                ] )
                              ),
                              ), 
                                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Align( 
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15, 
                              sigmaY: 15
                            ),
                            child: Container(
                              color: Colors.white.withOpacity(0.1),
                              child: CustomButtonWidget(
                                screenHeight: 48, 
                              screenWidth: 48, 
                              btnColor: Colors.transparent, 
                              child: Image.asset(e.save,)),
                            ),
                          ),
                        ),
                      ),
                    ), 

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Align( 
                        alignment: Alignment.bottomCenter,
                        child: TextWidget(
                          textAlign: TextAlign.center,
                          text: e.title,),
                      ),
                    )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
  }
}