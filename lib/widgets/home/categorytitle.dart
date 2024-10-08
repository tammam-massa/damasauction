import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String categoryName;
  final String adsCount;

  const CategoryTitle(
      {super.key, required this.categoryName, required this.adsCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          '$adsCount Ads',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
