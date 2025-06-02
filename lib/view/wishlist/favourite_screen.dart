import 'package:assignment/controller/favourite_controller.dart';
import 'package:assignment/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  final controller = Get.find<FavoritesController>();

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Wishlist', showBackButton: true),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(child: Text("No items in wishlist."));
        }
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200),
              child: ListTile(
                leading: Image.network(item.imageUrl, width: 50, height: 50),
                title: Text(item.name),
                subtitle: Text("₹${item.discountedPrice.toStringAsFixed(0)}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => controller.toggleFavorite(item),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
