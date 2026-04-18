class SpecialOffer {
  final String category;
  final String image;
  final int numOfBrands;

  SpecialOffer({
    required this.category,
    required this.image,
    required this.numOfBrands,
  });
}

// Our demo Special Offers
List<SpecialOffer> demoSpecialOffers = [
  SpecialOffer(
    image: "assets/images/Image Banner 2.png",
    category: "Smartphone",
    numOfBrands: 18,
  ),
  SpecialOffer(
    image: "assets/images/Image Banner 3.png",
    category: "Fashion",
    numOfBrands: 24,
  ),
];
