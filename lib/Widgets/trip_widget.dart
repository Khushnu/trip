import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trip/Widgets/custom_button.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/theme.dart';

class TripWidget extends StatefulWidget {
 final String title; 
  final String image; 
  final String placeIcon; 
  final String countryIcon;
  final String calendarIcon; 
  final String placeName;
  final int noOfCountry;
  final int noOfDays; 
  final String price; 
  final String numberofLikes;
  final String userName; 
  final String fromCountry;
  final String profileImage;
  final String icons;
  final String favorite; 
  const TripWidget({super.key, required this.title, required this.image, required this.placeIcon, required this.countryIcon, required this.calendarIcon, required this.placeName, required this.noOfCountry, required this.noOfDays, required this.price, required this.numberofLikes, required this.userName, required this.fromCountry, required this.profileImage, required this.icons, required this.favorite});

  @override
  State<TripWidget> createState() => _TripWidgetState();
}

class _TripWidgetState extends State<TripWidget> {
  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
          height: screenHeight * 0.4,
          width: screenWidth,
          
          decoration:  BoxDecoration(
            color:  primaryColor,
            borderRadius: BorderRadius.circular(15)
          ), 
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.2 + 20,
                // color: Colors.amberAccent,
                width: screenWidth, 
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                      child: SizedBox(
                        height: screenHeight * 0.2 + 20,
                        width: screenWidth,
                        child: Image.asset(widget.image, fit: BoxFit.cover )),
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
                              child: Image.asset(widget.icons,)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, ),
                child: Row(
                  children: [
                  TextWidget(text: widget.title, fontFamily: 'playfair', size: 20,), 
                  const Spacer(),
                  Image.asset(widget.favorite), 
                  TextWidget(text: widget.numberofLikes, size: 14,), 
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Image.asset(widget.placeIcon,), 
                  TextWidget(text: widget.placeName, colortext: Colors.white.withOpacity(0.6), size: 14,), 
                   SizedBox(
                    height: 10,
                    child: VerticalDivider(
                      color:  Colors.white.withOpacity(0.6)
                    ),
                  ),
                  Image.asset(widget.calendarIcon), 
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(text: '${widget.noOfCountry} Country', colortext: Colors.white.withOpacity(0.6), size: 14,), 
                   SizedBox(
                    height: 10,
                    child: VerticalDivider(
                      color:  Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Image.asset(widget.calendarIcon), 
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(text: '${widget.noOfDays} Days',colortext: Colors.white.withOpacity(0.6),  size: 14,), 
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox( 
                    width: 40, 
                    height: 40,
                    child: Stack( 
                      children: [
                        ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40, 
                          width: 40, 
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(widget.profileImage,), fit: BoxFit.cover)
                          ),
                        ),
                      ), 
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset('Images/star.png', scale: 1.7,))
                      ]
                    ),
                  ), 
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ 
                      TextWidget(text: widget.userName, size: 14, fontWeight: FontWeight.bold,), 
                      TextWidget(text: widget.fromCountry, size: 12,), 
                    ],
                  ), 
                  const Spacer(),
                  TextWidget(text: "\$${widget.price}", fontWeight: FontWeight.bold,)
                ],
              ),
            )
    
            ],
          ),
        );
  }
}