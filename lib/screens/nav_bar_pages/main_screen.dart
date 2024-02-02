import 'package:flutter/material.dart';
import 'package:flutter_group_1/screens/product_details_screen.dart';
import 'package:flutter_group_1/widgets/item_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Mobile",
      "icon": Icons.phone_android,
    },
    {
      "name": "Electronics",
      "icon": Icons.tv,
    },
    {
      "name": "Electricals",
      "icon": Icons.lightbulb_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover Products',
          style: TextStyle(
            fontSize: 24, // Change the font size as needed
            fontWeight: FontWeight.bold, // Apply bold style
            letterSpacing: 1.5, // Add spacing between letters
            color:
                const Color.fromARGB(255, 125, 17, 17), // Change the text color
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      productName: products[index]["name"],
                    ),
                  ),
                );
              },
              leading: Icon(products[index]["icon"]),
              title: Row(
                children: [
                  Text(products[index]["name"]),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward),
                ],
              ),
              subtitle: Text('Click to view product details'),
            ),
          );
        },
      ),
    );
  }
}
