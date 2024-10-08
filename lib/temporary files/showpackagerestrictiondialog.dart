import 'package:flutter/material.dart';

void showPackageRestrictionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Lands package'),
        content: const Text(
            "You can't add/edit ads into this category, because you are not subscribed to packages. Please contact our sales by tapping on WhatsApp button below."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Handle WhatsApp action
            },
            icon: const Icon(Icons.whatshot_outlined),
            label: const Text('WhatsApp'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple, // Button color
            ),
          ),
        ],
      );
    },
  );
}
