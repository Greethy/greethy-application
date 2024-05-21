class IndianFood {
  const IndianFood({
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  static List<IndianFood> getIndianRestaurants() {
    return const [
      IndianFood(image: 'assets/images/food3.jpg', name: 'Món\nCay'),
      IndianFood(image: 'assets/images/food5.jpg', name: 'Làm\nbánh'),
      IndianFood(image: 'assets/images/food1.jpg', name: 'Hải\nsản'),
      IndianFood(image: 'assets/images/food8.jpg', name: 'Ăn\nvặt'),
      IndianFood(image: 'assets/images/food9.jpg', name: 'Ăn\nvặt'),
      IndianFood(image: 'assets/images/food4.jpg', name: 'Ăn\nvặt'),
    ];
  }
}
