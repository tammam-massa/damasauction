import 'package:flutter/material.dart';

class RefundRequestPage extends StatelessWidget {
  const RefundRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Page background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text("Refund requests"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter the amount to be refunded:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Colors.white), // Border color white
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Colors.white), // Focused border color white
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Colors.white), // Enabled border color white
                ),
                filled: true,
                fillColor: Colors.white,
                suffixText: "SAR", // SAR inside the text field
                suffixStyle:
                    TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle refund logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFD8F02), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Curved edges
                  ),
                ),
                child: const Text(
                  "Refund",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
