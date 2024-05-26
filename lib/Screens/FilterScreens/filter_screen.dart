import 'package:flutter/material.dart';
import 'package:trip/Screens/FilterScreens/filter_screen_widget.dart';
import 'package:trip/Widgets/custom_button.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/theme.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with SingleTickerProviderStateMixin{

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
              const TextWidget(text: 'Filter', fontFamily: 'playfair', size: 25, ), 
              CustomButtonWidget(screenHeight: 40, 
              ontap: (){
                Navigator.pop(context);
              },
              screenWidth: 40, btnColor: secondaryColor, child: Icon(Icons.close, color: Colors.white.withOpacity(0.6),))
            ],
          ),
      ),
      body: Column(
        children: [
          
          DefaultTabController(
            
            length: 2, 
          child: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
           
            labelColor: Colors.transparent,
            dividerColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white.withOpacity(0.6),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 80, ),
            tabs: [
            SizedBox(
              height: screenHeight * 0.1 - 50, 
              width: screenWidth,
              child:  Center(child: TextWidget(text: 'Filtering',
                colortext: seelctedindex == 0 ? Colors.white : Colors.white.withOpacity(0.4) ,
               size: 17,))),
            SizedBox(
              height: screenHeight * 0.1 - 50, 
              width: screenWidth,
              child:  Center(child: TextWidget(text: 'Sorting', size: 17, 
               colortext: seelctedindex == 1 ? Colors.white : Colors.white.withOpacity(0.4)))),
            
          ])), 
          Expanded(child: TabBarView(
            controller: tabController,
            children: [
            FilterTabWidget(),
             Column(
              children: [
                Text('data')
              ],
            ), 
          ]))

        ],
      ),
    );
  }
}