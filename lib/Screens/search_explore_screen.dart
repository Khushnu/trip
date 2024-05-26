import 'package:flutter/material.dart';
import 'package:trip/Screens/SearchExploreScreenWidget/follow_screen_widget.dart';
import 'package:trip/Screens/SearchExploreScreenWidget/trip_screen.dart';
import 'package:trip/Widgets/custom_button.dart';
import 'package:trip/Widgets/text_input_widget.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/theme.dart';

class SearchExploreScreen extends StatefulWidget {
  const SearchExploreScreen({super.key});

  @override
  State<SearchExploreScreen> createState() => _SearchExploreScreenState();
}

class _SearchExploreScreenState extends State<SearchExploreScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;
  int seelctedindex =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this); 
    tabController.addListener(() {
    setState(() {
      seelctedindex = tabController.index;
    });
  });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
       automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButtonWidget(
              ontap: (){
                Navigator.pop(context);
              },
              screenHeight: 45, 
        screenWidth: 45, 
        btnColor: primaryColor, 
        child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white.withOpacity(0.8),)), 
  const SizedBox(
    width: 10,
  ),
        const Expanded(child: TextInputWidget(hintText: 'Search'))
          ],
        ),
      ),
      body: Column(
        children: [
          DefaultTabController(
            
            length: 2, 
          child: TabBar(
            // isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: tabController,
            labelColor: Colors.transparent,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white.withOpacity(0.6),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 40),
            tabs: [
              SizedBox(
                height: 50, 
                width: screenWidth * 0.2 ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('Images/Icons/globals.png', color: seelctedindex == 0 ? Colors.white : Colors.white.withOpacity(0.4), scale: 1.4,),
                    const SizedBox(width: 10,),
                     TextWidget(text: 'Trips', colortext:  seelctedindex == 0 ? Colors.white : Colors.white.withOpacity(0.4),),
                  ],
                ),
              ), 
              SizedBox(
                 height: 50, 
                width: screenWidth * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('Images/Icons/user.png', color: seelctedindex == 1 ? Colors.white : Colors.white.withOpacity(0.4), scale: 1.4,),
                    const SizedBox(width: 10,),
                     TextWidget(text: 'People', colortext: seelctedindex == 1 ? Colors.white : Colors.white.withOpacity(0.4),),
                  ],
                ),
              ), 
            ],
          )), 
          Expanded(
            child: TabBarView(
             
              controller: tabController,
              children: const [
             
              TripScreenWidget(),
            
             
              FollowScreenWidget()
           
            ]),
          )
        ],
      ),
    );
  }
}