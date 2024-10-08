import 'package:flutter/material.dart';

class ProfileEditField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? optionalText;
  final String initialValue; // New parameter for initial value
  final int maxLines;
  final Widget? suffixIcon;

  const ProfileEditField({
    Key? key,
    required this.label,
    required this.hintText,
    this.optionalText,
    this.initialValue = '', // Default value
    this.maxLines = 1,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (optionalText != null) ...[
          const SizedBox(height: 4),
          Text(optionalText!, style: TextStyle(color: Colors.grey)),
        ],
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue, // Bind the initial value
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Color(0xff358cde)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
