import 'package:damasauction/views/bidding/paymentmethodpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiddingCreditPage extends StatelessWidget {
  const BiddingCreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Background color for the page
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text("Bidding Credit"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCreditInfo("Total Credit", "0.00"),
            const SizedBox(height: 10), // Added space between containers
            _buildCreditInfo("Available Credit to bid", "0.00"),
            const SizedBox(height: 10), // Added space between containers
            _buildCreditInfo("Blocked Credit", "0.00"),
            const SizedBox(height: 20),
            const Text(
              "Enter amount to top up your Wallet",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // White background for amount text field
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Amount",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "SAR",
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "You can request a refund for your credit anytime unless you are the highest bidder.",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const PaymentMethodPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFD8F02), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Curved edges
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditInfo(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(20.0), // Increased padding for larger size
      decoration: BoxDecoration(
        color: Colors.white, // White background for credit info
        borderRadius: BorderRadius.circular(10), // Curved edges with radius 10
        border: Border.all(
          color: Colors.grey.shade300, // Bottom border color
          width: 1.0, // Border width
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
