import 'package:flutter/material.dart';

class EditInfoPage extends StatelessWidget {
  const EditInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Info'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xFFF2F2F2),
      ),
      body: Container(
        color: const Color(0xFFF2F2F2), // Background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person,
                          size: 50, color: Colors.grey),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.edit, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildLabeledTextField('Name', null, hintText: 'Name'),
              const SizedBox(height: 20),
              _buildLabeledTextField(
                'Email',
                'Optional',
                hintText: 'Email',
              ),
              const SizedBox(height: 20),
              _buildLabeledTextField(
                'Short description about you',
                'Optional',
                hintText: 'Short description about you',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              _buildLabeledTextField(
                'Select Location',
                'Optional',
                hintText: 'Select Location',
                suffixIcon: const Icon(Icons.location_on, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xffFD8F02),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide.none, // Clear shadow
                    ),
                  ),
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(
    String label,
    String? optionalText, {
    String? hintText,
    int maxLines = 1,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (optionalText != null) ...[
              const SizedBox(width: 10),
              Text(
                optionalText,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60, // Adjust the height as needed
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
