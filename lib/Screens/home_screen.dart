import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trip/Model/listmodel.dart';
import 'package:trip/Model/optionmodel.dart';
import 'package:trip/Screens/FilterScreens/filter_screen.dart';
import 'package:trip/Screens/search_explore_screen.dart';
import 'package:trip/Widgets/custom_button.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentSelected = listOption[0];
  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           CustomButtonWidget(
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const SearchExploreScreen()));
            },
            screenHeight: 45, 
            screenWidth: 45, 
            btnColor: primaryColor, 
            child: Icon(Icons.search_sharp, color: Colors.white.withOpacity(0.3),)),
            // SizedBox(
            //   width: 5,
            // ),
            Container(
              height: 48, 
              width: MediaQuery.sizeOf(context).width * 0.7 - 20, 
             decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.2)), 
              borderRadius: BorderRadius.circular(13)
             ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listOption.map((e) {
                bool isSelected = currentSelected == e;
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentSelected =e;
                      });
                    },
                    child: Container(
                      height: 40, 
                      width: (MediaQuery.sizeOf(context).width * 0.7 - 40)/ 2,
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : null, 
                        borderRadius: BorderRadius.circular(10),
                        // border: isSelected ? Border.all(color: Colors.white.withOpacity(0.2)) : null
                      ),
                      child: Center(
                        child: Text(e.title, style: TextStyle(
                          fontSize: 15, 
                          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5)),),
                      ),
                    ),
                  ),
                );
              }).toList(),
             ),
            ), 
             CustomButtonWidget(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const FilterScreen()));
              },
            screenHeight: 45, 
            screenWidth: 45, 
            btnColor: primaryColor, 
            child: Image.asset('Images/filter.png', scale: 1.4,)),
          ],
        ) ),
      body: listOfPlaces.isEmpty ? Center(
            child: Container(
              height: screenHeight * 0.2 + 20, 
              width: screenWidth, 
              decoration: BoxDecoration(
                color: primaryColor, 
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Image.asset('Images/search.png', scale: 1.4, color: Colors.black,),
                  ), 
                  Text('If you don’t currently follow anyone,\ndo so right now', 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),), 
                  CustomButtonWidget(
                    screenHeight: 40, 
                    screenWidth: screenWidth * 0.5, 
                    btnColor: Colors.white, 
                    child: const Text('Go to search'))
                ],
              ),
            ), 
          ) :Column(
        children: [ 
          currentSelected.title == 'Map' ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              TextWidget(text: 'Map is Loading')
            ],
          ) : 
           Expanded(
            child: ListView.builder(
              itemCount: listOfPlaces.length,
              itemBuilder: (_, index){
                var d = listOfPlaces[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                                child: Image.asset(d.image, fit: BoxFit.cover )),
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
                                      child: Image.asset(d.icons)),
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
                          TextWidget(text: d.title, fontFamily: 'playfair', size: 20,), 
                          const Spacer(),
                          Image.asset(d.favorite), 
                          TextWidget(text: d.numberofLikes, size: 14,), 
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
                          Image.asset(d.placeIcon,), 
                          TextWidget(text: d.placeName, colortext: Colors.white.withOpacity(0.6), size: 14,), 
                           SizedBox(
                            height: 10,
                            child: VerticalDivider(
                              color:  Colors.white.withOpacity(0.6)
                            ),
                          ),
                          Image.asset(d.calendarIcon), 
                          const SizedBox(
                            width: 5,
                          ),
                          TextWidget(text: '${d.noOfCountry} Country', colortext: Colors.white.withOpacity(0.6), size: 14,), 
                           SizedBox(
                            height: 10,
                            child: VerticalDivider(
                              color:  Colors.white.withOpacity(0.6),
                            ),
                          ),
                          Image.asset(d.calendarIcon), 
                          const SizedBox(
                            width: 5,
                          ),
                          TextWidget(text: '${d.noOfDays} Days',colortext: Colors.white.withOpacity(0.6),  size: 14,), 
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
                                    image: DecorationImage(image: AssetImage(d.profileImage,), fit: BoxFit.cover)
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
                              TextWidget(text: d.userName, size: 14, fontWeight: FontWeight.bold,), 
                              TextWidget(text: d.fromCountry, size: 12,), 
                            ],
                          ), 
                          const Spacer(),
                          TextWidget(text: "\$${d.price}", fontWeight: FontWeight.bold,)
                        ],
                      ),
                    )

                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}