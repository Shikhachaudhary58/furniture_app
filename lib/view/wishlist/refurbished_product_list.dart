import 'package:assignment/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class RefurbishedListScreen extends StatelessWidget {
  const RefurbishedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final refurbishedProducts = [
      {
        'name': 'Refurbished Desk',
        'price': '₹1,799',
        'image': 'https://img.icons8.com/color/96/000000/desk.png'
      },
      {
        'name': 'Refurbished Bookshelf',
        'price': '₹2,499',
        'image': 'https://img.icons8.com/color/96/000000/desk.png'
      },
      {
        'name': 'Refurbished Chair',
        'price': '₹1,299',
        'image': 'https://img.icons8.com/color/96/000000/desk.png'
      },
    ];

    return Scaffold(
      appBar: appBarWidget(
        'Refurbished Product',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
          children: refurbishedProducts.map((product) {
            return GestureDetector(
              onTap: () {
                // Navigate to product details screen here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        product['image']!,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      product['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['price']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Order logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Order Now"),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
