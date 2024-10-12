import 'package:flutter/material.dart';

class CategoryAdName extends StatelessWidget {
  final String categoryName;
  final int categoryId;
  final int? selectedCategoryId;
  final ValueChanged<int?> onChanged;

  const CategoryAdName({
    super.key,
    required this.categoryName,
    required this.categoryId,
    required this.selectedCategoryId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      value: categoryId, // Set the value to categoryId
      groupValue: selectedCategoryId, // Selected categoryId
      onChanged: onChanged, // Pass the selected categoryId back
      title: Text(
        categoryName, // Display the categoryName
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
