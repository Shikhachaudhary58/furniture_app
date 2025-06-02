class FurnitureItem {
  final String name;
  final String description;
  final double price;

  FurnitureItem({
    required this.name,
    required this.description,
    required this.price,
  });
}

List<FurnitureItem> allFurnitureItems = [
  FurnitureItem(
      name: "Flex 3 Seater Sofa",
      description: "Comfortable blue sofa",
      price: 10499),
  FurnitureItem(
      name: "Study Table",
      description: "Wooden table for students",
      price: 4599),
  FurnitureItem(
      name: "Office Chair",
      description: "Ergonomic and adjustable",
      price: 3499),
];
