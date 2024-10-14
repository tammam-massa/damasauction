import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Ensure you import this for DateFormat

class CustomAdTimeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;

  const CustomAdTimeTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              // Show the date picker when the field is tapped
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), // Set current date as default
                firstDate: DateTime(2000), // Minimum selectable date
                lastDate: DateTime(2101), // Maximum selectable date
              );

              if (pickedDate != null) {
                // Show time picker after a date is picked
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(), // Set current time as default
                );

                if (pickedTime != null) {
                  // If a time was picked, combine date and time
                  final DateTime selectedDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  // Format date and time to a readable format
                  final String formattedDateTime =
                      DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);

                  // Set the formatted date and time in the text field
                  controller.text = formattedDateTime;
                }
              }
            },
            child: AbsorbPointer(
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  hintText: hint,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
