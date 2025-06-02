import 'package:assignment/constants/description_constant.dart';
import 'package:assignment/controller/location_controller.dart';
import 'package:assignment/model/product_model.dart';
import 'package:assignment/view/home/cartscreen.dart';
import 'package:assignment/view/home/search_screen.dart';
import 'package:assignment/view/home/study_product_screen.dart';
import 'package:assignment/view/wishlist/allcoupenscreen.dart';
import 'package:assignment/view/wishlist/brandnew_product_list.dart';
import 'package:assignment/view/wishlist/coupondetail.dart';
import 'package:assignment/view/wishlist/favourite_screen.dart';
import 'package:assignment/view/wishlist/refurbished_product_list.dart';
import 'package:assignment/widgets/coupen_card.dart';
import 'package:assignment/widgets/slider_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:assignment/location/location_fetch.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> deals = [
    {
      "image": "assets/images/dealcard1.png",
      "title": "Flex 3 Seater Magic B...",
      "discount": "-72%",
      "price": "₹10,499",
    },
    {
      "image": "assets/images/dealcard2.png",
      "title": "Flex Fabric 3 Seater...",
      "discount": "-74%",
      "price": "₹9,499",
    },
  ];
  @override
  void initState() {
    super.initState();
    // Get.put(LocationController()).fetchUserLocation(); // 👈 Call this once
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    // Request permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Use new location settings
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
    );

    // Get the current position using new locationSettings
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap:
                                  //  _getCurrentLocation,
                                  () {
                                Get.find<LocationController>()
                                    .fetchUserLocation();
                              },
                              child: const Icon(Icons.location_on),
                            ),
                            const SizedBox(width: 8),
                            GetBuilder<LocationController>(
                              builder: (controller) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Delivery to'),
                                    Text(controller
                                        .userLocation), // shows address or pincode
                                  ],
                                );
                              },
                            ),
                            // const Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text('Delivery to'),
                            //     Text(
                            //         '1122002'), // Replace with actual location or pincode later
                            //   ],
                            // ),
                          ],
                        ),

                        // Spacer(),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.to(() => const SearchScreen());
                                },
                                child: const Icon(Icons.search)),
                            const Gap(5),
                            InkWell(
                                onTap: () {
                                  Get.to(() => FavoritesScreen());
                                },
                                child: const Icon(Icons.favorite_border)),
                            const Gap(5),
                            InkWell(
                                onTap: () {
                                  Get.to(() => CartScreen());
                                },
                                child:
                                    const Icon(Icons.shopping_cart_outlined)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: [
                    Container(
                      width: Get.width,
                      height: 300,
                      // margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFF007C91), // Teal background
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Stack(
                          children: [
                            // Yellow curve outline
                            Positioned(
                              top: -10,
                              bottom: -10,
                              right: -20,
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.amber, width: 2),
                                  color: Colors.lightBlue.shade900,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(150),
                                    bottomLeft: Radius.circular(150),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "FLAT 15% OFF",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "• Free 72hrs Delivery\n• 300+ Designs\n• Free Installation",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          height: 1.5,
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: const Text("BUY NOW"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Sofa image
                            Positioned(
                              bottom: -5,
                              // right: 0,
                              left: 50,
                              child: Image.asset(
                                "assets/images/homescreen.png",
                                width: 210,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Left side content
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "FURLENCO",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  // const SizedBox(height: 4),
                                  const Gap(20),
                                  Text(
                                    "FURNITURE\nUTSAV",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow.shade800,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // const Text(
                                  //   "FLAT 15% OFF",
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     color: Colors.amber,
                                  //     fontWeight: FontWeight.w700,
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 8),
                                  // const Text(
                                  //   "• Free 72hrs Delivery\n• 300+ Designs\n• Free Installation",
                                  //   style: TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.white,
                                  //     height: 1.5,
                                  //   ),
                                  // ),
                                  // const Spacer(),
                                  // ElevatedButton(
                                  //   onPressed: () {},
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Colors.white,
                                  //     foregroundColor: Colors.black,
                                  //     padding: const EdgeInsets.symmetric(
                                  //         horizontal: 16, vertical: 8),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(6),
                                  //     ),
                                  //   ),
                                  //   child: const Text("BUY NOW"),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SliderImages(
                    //     applyImageRadius: true,
                    //     imgUrl: 'assets/images/image_slide.jpeg',
                    //     borderRadius: 12),
                    // SliderImages(
                    //     applyImageRadius: true,
                    //     imgUrl: 'assets/images/slider_image.jpeg',
                    //     borderRadius: 24),
                    // SliderImages(
                    //     imgUrl: 'assets/images/ergonomic_chair.jpeg',
                    //     borderRadius: 12),
                    // SliderImages(
                    //     imgUrl: 'assets/images/ergonomic_chair.jpeg',
                    //     borderRadius: 12)
                  ],
                ),
              ),
              const Gap(10),
              Center(
                  child: Text(
                'BUY FURNITURE',
                style: GoogleFonts.josefinSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              )),
              const Gap(10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                // mainAxisSpacing: 5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryItem("Living Room", Icons.weekend, () {
                    Get.to(() => ProductGridScreen(
                        title: "Living Room Furniture",
                        products: livingRoomProducts));
                  }),
                  _buildCategoryItem("Bedroom", Icons.bed, () {
                    Get.to(() => ProductGridScreen(
                        title: "Bedroom Furniture", products: bedroomProducts));
                  }),
                  // _buildCategoryItem("Storage", Icons.wardrobe),
                  _buildCategoryItem("Study", Icons.chair, () {
                    Get.to(() => ProductGridScreen(
                        title: "Study Furniture", products: studyProducts));
                  }),
                  _buildCategoryItem("Dining", Icons.brunch_dining, () {
                    Get.to(() => ProductGridScreen(
                        title: "Dining Furniture",
                        products: diningRoomProducts));
                  }),
                  _buildCategoryItem("Tables", Icons.table_restaurant_sharp,
                      () {
                    Get.to(() => ProductGridScreen(
                        title: "Tables", products: tableProducts));
                  }),
                  _buildCategoryItem("Chairs", Icons.event_seat, () {
                    Get.to(() => ProductGridScreen(
                        title: "Chairs", products: chairProducts));
                  }),
                  _buildCategoryItem("Kitchen", Icons.kitchen, () {
                    Get.to(() => ProductGridScreen(
                        title: "Kitchen Furniture", products: kitchenProducts));
                  }),
                  _buildCategoryItem("Storage", Icons.storage, () {
                    Get.to(() => ProductGridScreen(
                        title: "Storage", products: kitchenProducts));
                  }),
                ],
              ),
              Center(
                child: _buildCategoryItem("Best Deal", Icons.local_offer, () {
                  Get.to(() => ProductGridScreen(
                      title: "Best Deal", products: kitchenProducts));
                }),
              ),

              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Brand New Card
                  _buildOptionCard(
                    context,
                    title: 'Brand New',
                    icon: Icons.inventory_2_outlined,
                    color: Colors.deepPurple.shade200,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const BrandNewListScreen()),
                      );
                    },
                  ),

                  // Refurbished Card
                  _buildOptionCard(
                    context,
                    title: 'Refurbished',
                    icon: Icons.recycling,
                    color: Colors.teal.shade200,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RefurbishedListScreen()),
                      );
                    },
                  ),
                ],
              ),
              const Gap(20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     _buildDealCard("BUY\nBrand New"),
              //     _buildDealCard("BUY\nRefurbished"),
              //   ],
              // ),
              // _sectionTitle("Offers & Discounts"),
              // _offerCard(
              //     "Extra ₹100 off on SBI\nNo code required", Icons.credit_card),
              // _offerCard(
              //     "Get flat 15% off\nUse Coupon: WELCOME", Icons.card_giftcard),
              // const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Offers & Discounts",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800)),
                    GestureDetector(
                      onTap: () => Get.to(() => const AllCouponsScreen()),
                      child: Row(
                        children: [
                          Text("See All",
                              style: TextStyle(color: Colors.grey.shade800)),
                          const Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CouponCard(
                      icon: Icons.account_balance,
                      title: "Extra ₹100 off on SBI",
                      subtitle: "Applicable on SBI Credit card",
                      footer: "No code required",
                      onTap: () => Get.to(() => const CouponDetailScreen(
                          title: "Extra ₹100 off on SBI")),
                    ),
                    CouponCard(
                      icon: Icons.percent,
                      title: "Get flat 15% off",
                      subtitle: "Get 15% discount on items",
                      footer: "Use Coupon XYZ15",
                      onTap: () => Get.to(() =>
                          const CouponDetailScreen(title: "Get flat 15% off")),
                    ),
                  ],
                ),
              ),

              // Scrollable Offer Cards
              // SizedBox(
              //   height: 100,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     children: [
              //       _buildOfferCard(
              //         backgroundColor: const Color(0xFFFFF4C2),
              //         icon: Icons.account_balance,
              //         iconColor: Colors.blue,
              //         title: "Extra ₹100 off on SBI",
              //         subtitle: "Applicable on SBI Credit car...",
              //         highlight: "No code required",
              //       ),
              //       const SizedBox(width: 12),
              //       _buildOfferCard(
              //         backgroundColor: const Color(0xFFFFF4C2),
              //         icon: Icons.percent,
              //         iconColor: Colors.orange,
              //         title: "Get flat 15% off",
              //         subtitle: "Get flat 15% discount on...",
              //         highlight: "Use Coupon XYZ15",
              //       ),
              //     ],
              //   ),
              // ),

              // Deals of the day
              // _sectionTitle("Deals of the day"),
              const Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(Icons.local_offer_outlined, size: 18),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.indigo.shade400),
                              child: const Center(
                                child: Icon(
                                  Icons.local_offer_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deals of the day",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                // SizedBox(height: 2),
                                Text("To buy",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: deals.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) {
                    final item = deals[index];
                    return _buildDealCard1(
                      imageUrl: item["image"],
                      title: item["title"],
                      discount: item["discount"],
                      price: item["price"],
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: 220,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       _productCard("Flex 3 Seater Magic B", "₹10,499", "-72%"),
              //       _productCard("Flex Fabric 3 Seater", "₹9,499", "-74%"),
              //     ],
              //   ),
              // ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.teal),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildDealCard(String title) {
    return Container(
      width: 140,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent.shade100, Colors.deepPurple],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("View All", style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _offerCard(String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _productCard(String title, String price, String discount) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.grey[300],
            child: const Center(child: Icon(Icons.chair, size: 50)),
          ),
          const SizedBox(height: 8),
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(4),
            color: Colors.yellow,
            child: Text("$discount off  $price",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // Future<Position> _getCurrentLocation() async {
  Widget _buildOptionCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          // height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
              ),
              const SizedBox(height: 10),
              const Text("BUY",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.josefinSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  // const SizedBox(height: 5),
                  const Icon(Icons.arrow_forward, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfferCard({
    required Color backgroundColor,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String highlight,
  }) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 10),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(highlight,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDealCard1({
    required String imageUrl,
    required String title,
    required String discount,
    required String price,
  }) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imageUrl,
                height: 100, width: double.infinity, fit: BoxFit.contain),
          ),
          // const SizedBox(height: 8),

          const Spacer(),
          // Product Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              // overflow: TextOverflow.ellipsis
            ),
          ),

          // const Spacer(),

          // Discount + Price
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFFFEB3B),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: RichText(
              text: TextSpan(
                text: discount,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                children: [
                  const TextSpan(
                    text: " off  ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: price,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
