import 'package:flutter/material.dart';

class MoreSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const MoreSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // White background for each section
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < items.length; i++) ...[
            items[i],
            if (i != items.length - 1) // Check if it's not the last item
              const Padding(
                padding: EdgeInsets.fromLTRB(
                    10, 12, 10, 12), // Left: 10, Top: 12, Right: 10, Bottom: 12
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xffEEEEEE), // Light grey color for the line
                ),
              ),
          ],
        ],
      ),
    );
  }
}
