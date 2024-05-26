import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip/Model/followmodel.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/theme.dart';

class FollowScreenWidget extends StatefulWidget {
  const FollowScreenWidget({super.key});

  @override
  State<FollowScreenWidget> createState() => _FollowScreenWidgetState();
}

class _FollowScreenWidgetState extends State<FollowScreenWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
   double screenWidth = MediaQuery.sizeOf(context).width;
    return ListView.builder(
      itemCount: listOfFollowers.length,
      itemBuilder: (_, index){
        var d = listOfFollowers[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenHeight * 0.1 - 20, 
            width: screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration:  BoxDecoration(
              color: secondaryColor, 
              borderRadius: BorderRadius.circular(16)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox( 
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
                        image: DecorationImage(image: AssetImage(d.image,), fit: BoxFit.cover)
                      ),
                    ),
                  ), 
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('Images/star.png', scale: 1.7,))
                  ]
                ),
              ),
          ), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: d.name),
              const SizedBox(
                height: 5,
              ),
              Row(
                
                children: [
                  Image.asset(d.followerIcon, scale: 2.2,), 
                  const SizedBox(
                    width: 4,
                  ),
                  TextWidget(text: d.like, size: 13, colortext: Colors.white.withOpacity(0.6),),
                  SizedBox(
                    height: 15,
                    child: VerticalDivider(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Image.asset(d.countryICon, scale: 2.2,), 
                   const SizedBox(
                    width: 4,
                  ),
                  TextWidget(text: d.countries, size: 13, colortext: Colors.white.withOpacity(0.6),),
                  
                ],
              ), 
            ],
          ), 
          Spacer(), 

          Container(
            height: 40, 
            width: 110,
            decoration:  BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: TextWidget(text: d.follow, colortext: Colors.black,),
            ),
          )
              ]
            )
          )
        );
    });
  }
}