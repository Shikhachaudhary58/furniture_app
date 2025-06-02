import 'package:flutter/material.dart';

Widget _buildCategoryItem(String label, IconData icon) {
  return Column(
    children: [
      Icon(icon, size: 32, color: Colors.teal),
      const SizedBox(height: 5),
      Text(label,
          style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
    ],
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
