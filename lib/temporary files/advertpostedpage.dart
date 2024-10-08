import 'package:flutter/material.dart';

class AdvertPostedPage extends StatefulWidget {
  const AdvertPostedPage({super.key});

  @override
  AdvertPostedPageState createState() => AdvertPostedPageState();
}

class AdvertPostedPageState extends State<AdvertPostedPage> {
  String selectedOption = ''; // Holds the selected option ('Gold' or 'Silver')

  void _showSnackBar(BuildContext context, String option) {
    // Function to show SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              '$option selected',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor:
            Colors.black.withOpacity(0.7), // Translucent black background
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        elevation: 0,
        duration: const Duration(seconds: 3), // SnackBar duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Larger box for the posted ad
              Container(
                padding: const EdgeInsets.all(80),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12), // Curved edge
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Your advert posted!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Text
              const Text(
                'Want to sell faster?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              // Smaller boxes for gold and silver promotion options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Gold promotion option wrapped with GestureDetector
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Gold'; // Set Gold as selected
                      });
                      _showSnackBar(context, 'Gold'); // Show SnackBar for Gold
                    },
                    child: _PromotionOption(
                      title: 'Gold',
                      description: '20x more',
                      icon: Icons.star,
                      color: Colors.yellow,
                      isSelected: selectedOption == 'Gold', // Check if selected
                    ),
                  ),

                  // Silver promotion option wrapped with GestureDetector
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Silver'; // Set Silver as selected
                      });
                      _showSnackBar(
                          context, 'Silver'); // Show SnackBar for Silver
                    },
                    child: _PromotionOption(
                      title: 'Silver',
                      description: '10x more',
                      icon: Icons.star_border,
                      color: Colors.grey,
                      isSelected:
                          selectedOption == 'Silver', // Check if selected
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Dashed rectangle for note text
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                    style: BorderStyle.solid, // Dashed border
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Note: Only approved ads could be promoted using Featured ads plans.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const Spacer(),

              // Rectangle with curved edges for buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Later" button action
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Later',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Promote Now" button action
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      backgroundColor: Colors.orange, // Change as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Promote Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PromotionOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isSelected; // New property to check if option is selected

  const _PromotionOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.isSelected, // Required to pass the selected state
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isSelected
            ? color.withOpacity(0.8) // Highlight when selected
            : color.withOpacity(0.2), // Regular color when not selected
        borderRadius: BorderRadius.circular(12), // Small box with curved edges
        border: isSelected
            ? Border.all(color: color, width: 3) // Highlighted border
            : null,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: color,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? Colors.black
                  : Colors.black54, // Change text color when selected
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
