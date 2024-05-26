
class ListModal{
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



  ListModal({
    required this.title,
     required this.image, 
     required this.placeIcon, required this.placeName,
      required this.countryIcon, required this.noOfCountry, 
      required this.calendarIcon, required this.noOfDays, 
      required this.numberofLikes, required this.price, 
      required this.userName, required this.fromCountry, required this.profileImage, 
      required this.icons, 
      required this.favorite
  });

}


List<ListModal> listOfPlaces = [
  ListModal(
  title: 'East Java & Komodo Islands',
  favorite: 'Images/Icons/heart.png',
  icons: 'Images/Icons/addsave.png',
   image: 'Images/image1.jpeg', 
   placeIcon: 'Images/Icons/flag-2.png', 
   placeName: '65 Places', countryIcon: 'Images/Icons/global.png', 
   noOfCountry: 2, calendarIcon: 'Images/Icons/calendar.png',
    noOfDays: 14, 
    numberofLikes: '143.2k', 
    price: '40,00', userName: 'Robin Hocepied', 
    fromCountry: 'Lisbon, Portugal', 
    profileImage: 'Images/profile1.jpeg'), 
  ListModal(title: 'Bali and Lombok Islands',
  favorite: 'Images/Icons/hearts.png',
  icons: 'Images/Icons/addmin.png',
   image: 'Images/image2.png', 
   placeIcon: 'Images/Icons/flag-2.png', 
   placeName: '100 Places', countryIcon: 'Images/Icons/global.png', 
   noOfCountry: 2, calendarIcon: 'Images/Icons/calendar.png',
    noOfDays: 12, 
    numberofLikes: '143.2k', 
    price: '\$50,00', userName: 'Kaylynn Dokidis', 
    fromCountry: 'Milan, Italy', 
    profileImage: 'Images/profile2.jpeg'), 
];