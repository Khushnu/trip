import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip/Model/followmodel.dart';
import 'package:trip/Widgets/popular_place_widget.dart';
import 'package:trip/Widgets/text_input_widget.dart';
import 'package:trip/Widgets/text_label_widget.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/Widgets/trip_widget.dart';
import 'package:trip/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.1 - 50,
              ),
              const TextWidget(
                text: 'Search',
                size: 25,
                fontFamily: 'playfair',
              ),
              const SizedBox(
                height: 20,
              ),
              const TextInputWidget(
                hintText: 'search trips and people',
                scale: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(
                text: 'Trips in the spotlight',
                size: 20,
                fontFamily: 'playfair',
              ),
              const SizedBox(
                height: 20,
              ),
              const TripWidget(
                  title: 'East Java & Komodo Islands',
                  favorite: 'Images/Icons/heart.png',
                  icons: 'Images/Icons/addsave.png',
                  image: 'Images/image1.jpeg',
                  placeIcon: 'Images/Icons/flag-2.png',
                  placeName: '65 Places',
                  countryIcon: 'Images/Icons/global.png',
                  noOfCountry: 2,
                  calendarIcon: 'Images/Icons/calendar.png',
                  noOfDays: 14,
                  numberofLikes: '143.2k',
                  price: '40,00',
                  userName: 'Robin Hocepied',
                  fromCountry: 'Lisbon, Portugal',
                  profileImage: 'Images/profile1.jpeg'),
              const SizedBox(
                height: 20,
              ),
              const TextLabelWidget(text: 'Popular Trips'),
              const SizedBox(
                height: 10,
              ),
              const PopularPlaceWidget(),
              const SizedBox(
                height: 10,
              ),
              const TextLabelWidget(text: 'Fresh trips for you'),
              const SizedBox(
                height: 10,
              ),
              const PopularPlaceWidget(),
              const SizedBox(
                height: 10,
              ),
              const TextWidget(
                text: 'Explore More Creators',
                fontFamily: 'playfair',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listOfFollowers.map((d) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Stack(children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.bottomRight,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      d.image,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Image.asset(
                                              'Images/star.png',
                                              scale: 1.7,
                                            ))
                                      ]),
                                    ),
                                  ),
                                  TextWidget(text: d.name),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        d.followerIcon,
                                        scale: 2.2,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget(
                                        text: d.like,
                                        size: 13,
                                        colortext:
                                            Colors.white.withOpacity(0.6),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        child: VerticalDivider(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                      Image.asset(
                                        d.countryICon,
                                        scale: 2.2,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget(
                                        text: d.countries,
                                        size: 13,
                                        colortext:
                                            Colors.white.withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        border: d.follow == 'Unfollow'
                                            ? Border.all(
                                                width: 2,
                                                color: Colors.white
                                                    .withOpacity(0.6))
                                            : null,
                                        color: d.follow == 'Unfollow'
                                            ? secondaryColor
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: TextWidget(
                                        text: d.follow,
                                        colortext: d.follow == 'Unfollow'
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  )
                                ])));
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
