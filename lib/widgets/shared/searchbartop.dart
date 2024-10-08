// Full-width search bar

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarTop extends StatelessWidget {
  const SearchBarTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
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
            hintText: 'search all ads'.tr,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none, // Remove the default border
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            hintStyle: TextStyle(
                color: Colors.grey.shade400), // Adjust hint text color
          ),
        ),
      ),
    );
  }
}
