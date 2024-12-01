import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List of clothing items
  final List<Map<String, String>> clothingItems = const [
    {
      "name": "T-Shirt",
      "image": "https://via.placeholder.com/150",
      "description": "Comfortable cotton t-shirt.",
      "price": "10 USD"
    },
    {
      "name": "Jeans",
      "image": "https://via.placeholder.com/150",
      "description": "Classic blue jeans.",
      "price": "20 USD"
    },
    {
      "name": "Jacket",
      "image": "https://via.placeholder.com/150",
      "description": "Stylish leather jacket.",
      "price": "50 USD"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("191508"),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            child: ListTile(
              leading: Image.network(item["image"]!),
              title: Text(item["name"]!),
              subtitle: Text(item["price"]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Map<String, String> item;

  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item["name"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item["image"]!),
            const SizedBox(height: 16),
            Text(item["name"]!, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(item["description"]!),
            const SizedBox(height: 8),
            Text("Price: ${item["price"]}"),
          ],
        ),
      ),
    );
  }
}
