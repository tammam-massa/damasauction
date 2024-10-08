import 'package:flutter/material.dart';

class CategoryItemCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;
  final int rowSpan;
  final int colSpan;

  const CategoryItemCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
    required this.rowSpan,
    required this.colSpan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          // Centering the image
          Center(
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),
          // Positioned title at the top-left
          Positioned(
            left: 8,
            top: 8,
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
