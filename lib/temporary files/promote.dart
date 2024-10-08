import 'package:flutter/material.dart';

class PromoteYourAdPage extends StatefulWidget {
  const PromoteYourAdPage({super.key});

  @override
  PromoteYourAdPageState createState() => PromoteYourAdPageState();
}

class PromoteYourAdPageState extends State<PromoteYourAdPage> {
  int selectedDays = 1;
  String selectedPlan = 'Gold';
  int featuredAdsCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Promote your ads'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text("Help?")),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section for "Needs More Contact Us"
              _buildNeedsMoreContactUs(),
              const SizedBox(height: 20),

              // First Page - Choose Type of Promoted Ad
              const Text(
                "Choose type of promoted ad",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildPlanOption(
                        'Gold',
                        'Gold featured ad will always show at the top of category.',
                        Icons.star),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildPlanOption(
                        'Silver',
                        'Silver featured ad will show between ads as you scroll.',
                        Icons.stars),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Choose Display Position
              const Text(
                "Choose display position",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildDisplayOption("All subcategories", true),
                  ),
                  Expanded(
                    child: _buildDisplayOption("One subcategory", false),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Second Page - Choose Number of Days
              const Text(
                "Choose number of days",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildDayOption(1, 75),
                  _buildDayOption(3, 66.67),
                  _buildDayOption(7, 57.14),
                ],
              ),
              const SizedBox(height: 20),

              // Featured Ad Plans
              const Text(
                "Choose number of featured ads plans",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                "Plans will expire within 3 months if not used",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Slider(
                value: featuredAdsCount.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                label: "$featuredAdsCount",
                activeColor: Colors.purple,
                onChanged: (double value) {
                  setState(() {
                    featuredAdsCount = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 20),

              // Summary Section
              _buildSummarySection(),

              // Buy Now Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the third page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Button color
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Buy now",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(String plan, String description, IconData icon) {
    bool isSelected = selectedPlan == plan; // Check if the plan is selected
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = plan; // Update selected plan when clicked
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple.withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 50, color: isSelected ? Colors.purple : Colors.grey),
            const SizedBox(height: 10),
            Text(
              plan,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.purple : Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplayOption(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Handle selection
      },
      child: Row(
        children: [
          Radio(
            value: isSelected,
            groupValue: true,
            onChanged: (bool? value) {
              // Handle radio change
            },
            activeColor: Colors.purple,
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildDayOption(int days, double pricePerDay) {
    bool isSelected = selectedDays == days;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedDays = days;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple.withOpacity(0.1) : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.purple : Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                "$days day${days > 1 ? 's' : ''}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.purple : Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$pricePerDay QAR/day",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          Text("Type of plan: $selectedPlan",
              style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          const Text("Views you will get: x20", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          Text("Total price: ${selectedDays * 75} QAR",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildNeedsMoreContactUs() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Needs more? Contact Us",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle contact us action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Button color
            ),
            child: const Text('Contact Us'),
          ),
        ],
      ),
    );
  }
}
