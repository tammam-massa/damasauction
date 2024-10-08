import 'package:flutter/material.dart';

class CategoryTileDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const CategoryTileDrawer(
      {super.key,
      required this.title,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: color),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Icon(Icons.chevron_right_outlined,
                  color: color), // Use variable color
            ],
          ),
          onTap: () {},
        ),
        const Divider(indent: 16, endIndent: 16), // Divider with padding
      ],
    );
  }
}
