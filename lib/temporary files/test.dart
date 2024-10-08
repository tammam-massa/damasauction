import 'package:flutter/material.dart';

class FamilyNeedsPage extends StatelessWidget {
  const FamilyNeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family needs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Family needs",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "14910 Ads",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns grid layout
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio:
                      2 / 3, // Adjust the aspect ratio for rectangular items
                ),
                children: [
                  // First row
                  _buildCategoryItem("Job Vacancies",
                      "assets/images/furniture.png", Colors.grey, 1, 1),
                  _buildCategoryItem("Job Seekers",
                      "assets/images/furniture.png", Colors.blue, 2, 1),

                  // Second row
                  _buildCategoryItem("Men stuff", "assets/images/furniture.png",
                      Colors.yellow[100]!, 1, 1),
                  _buildCategoryItem("Women stuff",
                      "assets/images/furniture.png", Colors.orange[100]!, 1, 1),
                  _buildCategoryItem("Kids stuff",
                      "assets/images/furniture.png", Colors.brown[100]!, 1, 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each category item with control over the cross and main axis span
  Widget _buildCategoryItem(String title, String imagePath, Color color,
      int crossAxisSpan, int mainAxisSpan) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath,
                height: crossAxisSpan == 2
                    ? 100
                    : 60), // Adjust image size based on span
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
