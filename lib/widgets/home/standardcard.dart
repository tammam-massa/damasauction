import 'package:flutter/material.dart';

// Standard Card Class
class StandardCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color bgColor;
  final VoidCallback onTap;

  const StandardCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
          10), // Ensure ripple effect fits the rounded edges
      child: Container(
        width: 105,
        height: 140,
        decoration: BoxDecoration(
          color: bgColor, // Set background color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Positioned image at the bottom-right corner
            Positioned(
              bottom: 0,
              left: 0,
              child: standardCardImage(imagePath),
            ),
            // Positioned title at the top
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: standardCardTitle(title),
            ),
          ],
        ),
      ),
    );
  }

  Widget standardCardImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Add rounding to the image
      child: Image.asset(
        imagePath,
        // width: 80, // Adjust the width as needed
        height: 70, // Adjust the height as needed
        fit: BoxFit.cover,
      ),
    );
  }

  Widget standardCardTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
