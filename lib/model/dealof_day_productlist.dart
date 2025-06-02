class Product {
  final String name;
  final String imageUrl;
  final String image3DUrl; // for 3D hover
  final double price;
  final int discount;

  Product({
    required this.name,
    required this.imageUrl,
    required this.image3DUrl,
    required this.price,
    required this.discount,
  });
}
