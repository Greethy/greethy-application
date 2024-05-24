class Support {
  const Support({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  static List<Support> getSupportServices() {
    return const [
      Support(image: 'assets/icons/home.png', title: 'Home\nFood'),
      Support(image: 'assets/icons/documents.png', title: 'Documents\nBooks'),
      Support(image: 'assets/icons/delivery.png', title: 'Business\nDeliveries'),
      Support(image: 'assets/icons/courier.png', title: 'Courier'),
      Support(image: 'assets/icons/more.png', title: 'Anything\nElse'),
    ];
  }
}
