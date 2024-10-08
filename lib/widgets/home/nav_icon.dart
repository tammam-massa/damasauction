import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const NavIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 22.0, // Adjust icon size
            color: selectedIndex == index
                ? const Color(0xff358cde)
                : const Color(0xffAFAFAF),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0, // Adjust text size
              color: selectedIndex == index
                  ? const Color(0xff358cde)
                  : const Color(0xffAFAFAF),
            ),
          ),
        ],
      ),
    );
  }
}
