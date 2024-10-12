import 'package:flutter/material.dart';

class SearchBarTop extends StatelessWidget {
  final String hint; // Declare hint as a final field

  const SearchBarTop(
      {super.key, required this.hint}); // Make hint required in the constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Padding for the container
      child: Container(
        width: double.infinity, // Set width to take the full width
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hint, // Use the hint passed from constructor
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none, // Remove the default border
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0), // Vertical padding
            hintStyle: TextStyle(
                color: Colors.grey.shade400), // Adjust hint text color
          ),
        ),
      ),
    );
  }
}
