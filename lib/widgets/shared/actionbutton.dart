import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final IconData iconData;
  final void Function()? onPressed;

  const ActionButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button color
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Curved button
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white, // Icon color
            ),
            const SizedBox(width: 10), // Space between icon and text
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
