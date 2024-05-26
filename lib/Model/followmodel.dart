class FollowModel{
  final String name; 
  final String like; 
  final String countries; 
  final String follow; 
  final String image;
  final String countryICon; 
  final String followerIcon;
  FollowModel({
    required this.countryICon,
    required this.followerIcon,
    required this.name, required this.like, required this.image, required this.countries, required this.follow
  });
}

List<FollowModel> listOfFollowers = [
  FollowModel(
  name: 'Jaydon Levin', 
  countryICon: 'Images/Icons/globals.png',
  followerIcon: 'Images/Icons/user.png',
  like: '143.2k', 
  image: 'Images/profile1.jpeg', 
  countries: '40', 
  follow: 'Unfollow'),
  FollowModel(
  name: 'Jaydon Levin', 
  countryICon: 'Images/Icons/globals.png',
  followerIcon: 'Images/Icons/user.png',
  like: '143.2k', 
  image: 'Images/profile1.jpeg', 
  countries: '40', 
  follow: 'Follow'),
  FollowModel(
  name: 'Jaydon Levin', 
  countryICon: 'Images/Icons/globals.png',
  followerIcon: 'Images/Icons/user.png',
  like: '143.2k', 
  image: 'Images/profile1.jpeg', 
  countries: '40', 
  follow: 'Follow'),
  FollowModel(
  name: 'Jaydon Levin', 
  countryICon: 'Images/Icons/globals.png',
  followerIcon: 'Images/Icons/user.png',
  like: '143.2k', 
  image: 'Images/profile1.jpeg', 
  countries: '40', 
  follow: 'Follow'),
  FollowModel(
  name: 'Jaydon Levin', 
  countryICon: 'Images/Icons/globals.png',
  followerIcon: 'Images/Icons/user.png',
  like: '143.2k', 
  image: 'Images/profile1.jpeg', 
  countries: '40', 
  follow: 'Follow'),
];