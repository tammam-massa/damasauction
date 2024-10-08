import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const RectangleButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple, // يمكنك تعديل اللون
          borderRadius:
              BorderRadius.circular(8), // Optional: Adds rounded corners
        ),
        height: 80,
        width: 120,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
