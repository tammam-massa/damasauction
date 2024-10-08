// Class for building the language button
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const LanguageButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onChanged(value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: groupValue == value
                  ? const Color(0xff358cde)
                  : Colors.grey[300]!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (groupValue == value)
                const Icon(Icons.check, color: Color(0xff358cde), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: groupValue == value
                      ? const Color(0xff358cde)
                      : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
