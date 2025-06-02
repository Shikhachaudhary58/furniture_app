import 'package:assignment/model/product_model.dart';
import 'package:assignment/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  final Product product;

  const OrderSummaryScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Order Summary',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.imageUrl, width: 100, height: 100),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("Type: ${product.type}"),
                      const SizedBox(height: 4),
                      Text("₹${product.price}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.green)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Divider(),

            const Text("Price Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Price"),
                Text("₹${product.price}"),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charges"),
                Text("₹99"),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹${product.price + 99}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),

            const Text("Select Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("Cash on Delivery"),
              trailing: const Icon(Icons.check_circle, color: Colors.teal),
              onTap: () {
                // Handle payment method selection
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Place order logic
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Order placed successfully!")));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Place Order",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
