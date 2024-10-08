import 'package:flutter/material.dart';

class CategoryAdName extends StatelessWidget {
  final String category;
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryAdName({
    super.key,
    required this.category,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      value: category,
      groupValue: selectedCategory,
      onChanged: onChanged,
      title: Text(
        category,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      activeColor:
          const Color(0xff358cde), // Color of the selected radio button
    );
  }
}
