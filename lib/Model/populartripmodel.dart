class PopularTripModel{
  final String image;
  final String title; 
  final String save;

  PopularTripModel({required this.image, required this.save, required this.title});

}

List<PopularTripModel> listPopularPlaces = [
  PopularTripModel(image: 'Images/image5.jpeg', 
  save: 'Images/Icons/addmin.png', title: 'Highway\nhues expedition'), 
  PopularTripModel(image: 'Images/image6.png', 
  save: 'Images/Icons/addmin.png', title: 'Wanderlust trails'), 
  PopularTripModel(image: 'Images/image7.png', 
  save: 'Images/Icons/addmin.png', title: 'Highway\n hues expedition'), 
];