import 'package:damasauction/controllers/more/more_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreElement extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap; // onTap callback for the ListTile

  MoreElement({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  final MoreControllerImp moreController = Get.put(MoreControllerImp());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40, // Icon container width
        height: 40, // Icon container height
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.8), // Darker icon background color
          borderRadius: BorderRadius.circular(8), // Rounded edges
        ),
        child: Center(
          child: Icon(icon, color: Colors.white), // White icon color
        ),
      ),
      title: Text(title),
      onTap: onTap, // Use the passed onTap action
    );
  }
}
