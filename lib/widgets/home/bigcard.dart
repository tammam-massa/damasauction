import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color bgColor;
  //final double width; // Custom width parameter
  final VoidCallback onTap; // Add onTap parameter

  const BigCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgColor,
    // required this.width,
    required this.onTap, // Make onTap required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          width: 220, // Set the width for the big card
          height: 140, // Define the height explicitly to avoid layout issues
          child: Stack(
            children: [
              // Background with border radius
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Positioned text in the top-left corner
              Positioned(
                top: 2,
                right: 4,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              // Positioned image in the extreme bottom-right corner
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  imagePath,
                  height: 70, // Adjust the height as necessary
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
