import 'package:flutter/material.dart';
import 'package:trip/Model/navbaritems.dart';
import 'package:trip/Screens/home_screen.dart';
import 'package:trip/Screens/notification_screen.dart';
import 'package:trip/Screens/person_screen.dart';
import 'package:trip/Screens/search_screen.dart';
import 'package:trip/Widgets/custom_button.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  var currentSelected = navbaritemsList[0];

  static const List<Widget> listofWidget = [
    HomeScreen(),
    SearchScreen(),
    NotifCationScreen(),
    PersonScreen()
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: Container(
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
                bool isSelected = index == _selectedIndex;
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
      ),
      body: listofWidget[_selectedIndex],
    );
}
}