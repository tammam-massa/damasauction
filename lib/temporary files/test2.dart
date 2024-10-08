import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mzad Qatar'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vehicles',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              '29838 Ads',
              style: TextStyle(color: Color.fromARGB(255, 131, 100, 100)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // Rent Cars card with fixed width
                        SizedBox(
                          width: 100, // Fixed width for Rent Cars
                          child: _buildCategoryCard(
                            'Rent Cars',
                            'assets/images/furniture.png',
                            Colors.blue.shade100,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Offshore Tools card with a custom method for bigger size
                        Expanded(
                          child: _buildCategoryCardBig(
                            'Offshore Tools',
                            'assets/images/lands.png',
                            Colors.grey.shade200,
                            300, // Custom width for Offshore Tools
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // Equal width for these cards
                        Expanded(
                          flex: 1,
                          child: _buildCategoryCard(
                            'Spare Parts',
                            'assets/images/furniture.png',
                            Colors.green.shade100,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: _buildCategoryCard(
                            'Heavy Equipment',
                            'assets/images/furniture.png',
                            Colors.yellow.shade100,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: _buildCategoryCard(
                            'Mzad Yard',
                            'assets/images/furniture.png',
                            Colors.purple.shade100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Normal category card method
  Widget _buildCategoryCard(
    String title,
    String imagePath,
    Color bgColor,
  ) {
    return SizedBox(
      height: 150, // Define the height explicitly to avoid layout issues
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Position text in the top-left corner
          Positioned(
            top: 12,
            left: 5,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Positioned image in the bottom-right corner
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(imagePath, height: 70),
          ),
        ],
      ),
    );
  }

  // New method for Offshore Tools with a bigger width and image in the extreme bottom right
  Widget _buildCategoryCardBig(
    String title,
    String imagePath,
    Color bgColor,
    double width, // Custom width parameter
  ) {
    return SizedBox(
      width: width, // Set the width for the big card
      height: 150, // Define the height explicitly to avoid layout issues
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Position text in the top-left corner
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Positioned image in the extreme bottom-right corner
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              imagePath,
              height: 100, // Adjust the height as necessary
            ),
          ),
        ],
      ),
    );
  }
}
