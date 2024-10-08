import 'package:flutter/material.dart';

class ChooseCategoryPage extends StatefulWidget {
  const ChooseCategoryPage({super.key});

  @override
  ChooseCategoryPageState createState() => ChooseCategoryPageState();
}

class ChooseCategoryPageState extends State<ChooseCategoryPage> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5), // Light grey background for the whole page
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button with Text and Page Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      // Handle back action
                    },
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Choose Category',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(), // To center the title
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 categories per row
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 2.5, // Adjust for card shape
                  ),
                  itemCount: categories.length, // Number of categories
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return _buildCategoryCard(
                        category['name']!, category['description']!);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle next action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C2956), // Button color
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Curved button
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build each category card
  Widget _buildCategoryCard(String name, String description) {
    bool isSelected = selectedCategory == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = name;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEAEAEA)
              : Colors.white, // Grey when selected
          borderRadius: BorderRadius.circular(15), // Curved edges for the box
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow for box
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected
                    ? const Color(0xFF9C2956)
                    : Colors.black, // Color when selected
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample categories
final List<Map<String, String>> categories = [
  {
    'name': 'Electronics',
    'description': 'Smartphones, laptops, gadgets, and more.',
  },
  {
    'name': 'Fashion',
    'description': 'Clothes, shoes, and accessories.',
  },
  {
    'name': 'Automotive',
    'description': 'Cars, bikes, and vehicle parts.',
  },
  {
    'name': 'Real Estate',
    'description': 'Houses, apartments, and properties.',
  },
  {
    'name': 'Services',
    'description': 'Cleaning, repair, and other services.',
  },
  {
    'name': 'Home Appliances',
    'description': 'Fridges, TVs, and other appliances.',
  },
];
