class TravelCategoryModel{
  final String icon; 
  final String name; 

TravelCategoryModel({ required this.icon, required this.name});
}

List<TravelCategoryModel> listCategoryTravel = [
  TravelCategoryModel(icon: 'Images/Icons/beach.png', name: 'Beach'),
  TravelCategoryModel(icon: 'Images/Icons/mountain.png', name: 'Mountains'),
  TravelCategoryModel(icon: 'Images/Icons/dessert.png', name: 'Desert'),
  TravelCategoryModel(icon: 'Images/Icons/jungle.png', name: 'Jungle'),
  TravelCategoryModel(icon: 'Images/Icons/city.png', name: 'City'),
  TravelCategoryModel(icon: 'Images/Icons/heirtage.png', name: 'Cultural Heritage'),
];