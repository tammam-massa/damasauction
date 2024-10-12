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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged(categoryId),
            child: Container(
              width: 20, // Smaller outer circle width
              height: 20, // Smaller outer circle height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.white, // White background color for the outer circle
                border: Border.all(
                  color: selectedCategoryId == categoryId
                      ? Colors.white // White border when selected
                      : Colors.transparent, // No border when unselected
                  width: 2,
                ),
              ),
              child: selectedCategoryId == categoryId
                  ? const Center(
                      child: CircleAvatar(
                        radius: 6, // Smaller inner circle radius
                        backgroundColor:
                            Color(0xff358cde), // Blue color for inner circle
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 10), // Space between the radio and text
          Text(
            categoryName,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500), // Slightly larger text size
          ),
        ],
      ),
    );
  }
}
