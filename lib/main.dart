import 'package:assignment/controller/cart_controller.dart';
import 'package:assignment/controller/favourite_controller.dart';
// import 'package:assignment/controller/location_controller.dart';
import 'package:assignment/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(FavoritesController());
  Get.put(CartController());
  // Get.put(LocationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Furniture Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set global background
      ),
      home: const HomeScreen(),
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = 500;
            bool isWide = constraints.maxWidth > maxWidth;

            return Center(
              child: SizedBox(
                width: isWide ? maxWidth : double.infinity,
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
