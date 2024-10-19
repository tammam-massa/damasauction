import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final bool isLoading;
  final IconData? icon; // Optional icon parameter

  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    this.isLoading = false, // Default to false
    this.icon, // Optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: backgroundColor,
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: const Color(0xff358cde),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.white), // Display the icon
                  const SizedBox(width: 8), // Space between icon and text
                ],
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
    );
  }
}
