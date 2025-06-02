import 'package:assignment/data/furniture_itemlist.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<FurnitureItem> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allFurnitureItems; // Initial full list
  }

  void _search(String query) {
    final results = allFurnitureItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: _search,
          decoration: const InputDecoration(
            hintText: 'Search for furniture...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (_, index) {
          final item = filteredItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text('₹${item.price.toStringAsFixed(0)}'),
            onTap: () {
              // Navigate to detail screen if needed
              // Get.to(() => FurnitureDetailScreen(item: item));
            },
          );
        },
      ),
    );
  }
}
