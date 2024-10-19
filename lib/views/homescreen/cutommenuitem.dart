import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomMenuItem({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.blue : Colors.grey, // Icon color logic
          ),
          const SizedBox(height: 4), // Add some space between icon and text
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey, // Text color logic
              fontSize: 12, // Adjust font size as needed
            ),
          ),
        ],
      ),
    );
  }
}
