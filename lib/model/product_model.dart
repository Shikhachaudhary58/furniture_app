import 'package:assignment/constants/description_constant.dart';
import 'package:assignment/constants/image_constants.dart';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String? image3DUrl;
  final double price;
  final double? discount;
  final String? type;
  final String? description;
  final double? rating;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.image3DUrl,
    required this.price,
    this.discount,
    this.type,
    this.rating,
    this.description,
  });

  // double get discountedPrice => price - (price * discount! / 100);
  double get discountedPrice => price * 0.9;
}

final List<Product> bedroomProducts = [
  Product(
    id: '9',
    name: "Wooden King Size Bed",
    price: 14999,
    imageUrl: bedroom1,
    image3DUrl: bedroom1,
    description: kingsizebed,
    type: "Bedroom Furniture",
    rating: 4.5,
  ),
  Product(
    id: '10',
    name: "Wooden Street Premium Bed",
    price: 10499,
    imageUrl: bedroom2,
    description:
        "Proper sleep can improve your overall well-being, and a comfortable bed is crucial to sleep well. This furniture can give your body the right support by keeping the natural alignment and posture of your body in place.",
    type: "Bedroom Furniture",
    rating: 4.0,
  ),
  Product(
    id: '11',
    name: "Bunk bed",
    price: 15999,
    discount: 19999,
    imageUrl: bedroom3,
    description: bunkBed,
    type: "Bedroom Furniture",
    rating: 4.2,
  ),
  Product(
    id: '12',
    name: "Side Drawer",
    price: 5499,
    imageUrl: bedroom4,
    description: sideDrawer,
    type: "Bedroom Furniture",
    rating: 4.3,
  ),
];

final List<Product> livingRoomProducts = [
  Product(
    id: '13',
    name: "Modern Sofa Set",
    price: 19999,
    imageUrl: livingRoom1,
    description: livingroom1,
    type: "Living Room Furniture",
    rating: 4.6,
  ),
  Product(
    id: '14',
    name: "TV Unit",
    price: 7999,
    imageUrl: livingRoom2,
    description: livingroom2,
    type: "Living Room Furniture",
    rating: 4.2,
  ),
  Product(
    id: '15',
    name: "Coffee Table",
    price: 2499,
    imageUrl: livingRoom3,
    description: livingroom3,
    type: "Living Room Furniture",
    rating: 4.1,
  ),
  Product(
    id: '16',
    name: "Recliner Chair",
    price: 8999,
    imageUrl: livingRoom4,
    description: livingroom4,
    type: "Living Room Furniture",
    rating: 4.5,
  ),
];
final List<Product> diningRoomProducts = [
  Product(
    id: '17',
    name: "6-Seater Dining Table",
    price: 13499,
    imageUrl: dining1,
    description: "Wooden 6-seater dining table with chairs.",
    type: "Dining Room Furniture",
    rating: 4.4,
  ),
  Product(
    id: '18',
    name: "Dining Bench",
    price: 3499,
    imageUrl: diningbench,
    description: "Solid wood dining bench to match your table.",
    type: "Dining Room Furniture",
    rating: 4.0,
  ),
  Product(
    id: '19',
    name: "Glass Cabinet",
    price: 6999,
    imageUrl: galsscabinet,
    description: "Elegant display cabinet for dining essentials.",
    type: "Dining Room Furniture",
    rating: 4.3,
  ),
];
final List<Product> kitchenProducts = [
  Product(
    id: '20',
    name: "Modular Kitchen Cabinet",
    price: 15499,
    imageUrl: modularkitchen,
    description: "Durable and stylish modular kitchen cabinet.",
    type: "Kitchen Furniture",
    rating: 4.4,
  ),
  Product(
    id: '21',
    name: "Kitchen Trolley",
    price: 2999,
    imageUrl: kitchentrolley,
    description: "Portable kitchen trolley with storage shelves.",
    type: "Kitchen Furniture",
    rating: 4.2,
  ),
  Product(
    id: '22',
    name: "Microwave Stand",
    price: 1899,
    imageUrl: microwavestand,
    description: "Compact stand for microwave and small appliances.",
    type: "Kitchen Furniture",
    rating: 4.1,
  ),
];

final List<Product> chairProducts = [
  Product(
    id: '23',
    name: "Ergonomic Office Chair",
    price: 5499,
    imageUrl: ergonomicchair,
    description: "Comfortable office chair with lumbar support.",
    type: "Chairs",
    rating: 4.5,
  ),
  Product(
    id: '24',
    name: "Rocking Chair",
    price: 3999,
    imageUrl: rockingchair,
    description: "Wooden rocking chair perfect for relaxation.",
    type: "Chairs",
    rating: 4.3,
  ),
  Product(
    id: '25',
    name: "Dining Chair",
    price: 1799,
    imageUrl: diningchair,
    description: "Upholstered dining chair with cushioned seat.",
    type: "Chairs",
    rating: 4.1,
  ),
];
final List<Product> tableProducts = [
  Product(
    id: '26',
    name: "Study Table",
    price: 2999,
    imageUrl: studytable,
    description: "Compact study table with storage drawer.",
    type: "Tables",
    rating: 4.2,
  ),
  Product(
    id: '27',
    name: "Workstation Table",
    price: 4899,
    imageUrl: workstationtable,
    description: "Spacious table for computer and work essentials.",
    type: "Tables",
    rating: 4.4,
  ),
  Product(
    id: '28',
    name: "Console Table",
    price: 2399,
    imageUrl: consoleTable,
    description: "Slim console table for hallway or living room.",
    type: "Tables",
    rating: 4.0,
  ),
];
final List<Product> studyProducts = [
  Product(
    id: '29',
    name: "Study Desk with Bookshelf",
    price: 6499,
    imageUrl: studytable1,
    description: "Study desk with integrated bookshelf and drawers.",
    type: "Study Room Furniture",
    rating: 4.6,
  ),
  Product(
    id: '30',
    name: "Wall-Mounted Study Unit",
    price: 4999,
    imageUrl: wallmounted,
    description: "Space-saving wall-mounted study unit.",
    type: "Study Room Furniture",
    rating: 4.3,
  ),
  Product(
    id: '31',
    name: "Student Chair",
    price: 1599,
    imageUrl: studentchair,
    description: "Ergonomic student chair with back support.",
    type: "Study Room Furniture",
    rating: 4.2,
  ),
];
