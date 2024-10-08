import 'package:damasauction/widgets/shared/categorytiledrawer.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String title;
  final List categories;

  const CustomDrawer(
      {super.key, required this.title, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                var category = categories[index];

                // Add null safety checks
                int? categoryId =
                    category['id'] != null ? category['id'] as int : 0;
                String categoryName = category['name'] ?? 'Unknown';

                return CategoryTileDrawer(
                  title: categoryName, // Null-safe category name
                  icon: _getIconForCategory(categoryId), // Safe fallback icon
                  color:
                      const Color(0xff358cde), // Customize the color if needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Example helper function to return an icon based on the category id with fallback
  IconData _getIconForCategory(int categoryId) {
    switch (categoryId) {
      case 1:
        return Icons.apartment;
      case 2:
        return Icons.landscape;
      case 3:
        return Icons.directions_car;
      // Add more cases for other category IDs and icons
      default:
        return Icons.category; // Fallback icon for unknown categories
    }
  }
}
