import 'package:damasauction/views/bidding/paymentpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  PaymentMethodPageState createState() => PaymentMethodPageState();
}

class PaymentMethodPageState extends State<PaymentMethodPage> {
  String _selectedPaymentMethod = 'Transfer'; // Default selected method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3), // Page background color
      appBar: AppBar(
        title: const Text('Payment Method'),
        backgroundColor: const Color(0xFFf3f3f3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Transfer Radio Button with Icon
            Row(children: [
              Radio<String>(
                value: 'Transfer',
                groupValue: _selectedPaymentMethod,
                activeColor: const Color(0xffFD8F02), // Radio button color
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              const Icon(
                Icons.swap_horiz, // Transfer icon
                size: 30,
                color: Color(0xff000000),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Transfer',
                style: TextStyle(fontSize: 20),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              Radio<String>(
                value: 'Cash',
                groupValue: _selectedPaymentMethod,
                activeColor: const Color(0xffFD8F02), // Radio button color
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              const Icon(
                Icons.money_rounded, // Transfer icon
                size: 30,
                color: Color(0xff000000),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Cash',
                style: TextStyle(fontSize: 20),
              ),
            ]),
            // Cash Radio Button with Icon
            const SizedBox(
              height: 50,
            ),

            // Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle pay logic here
                  Get.snackbar('Payment Method', 'Payment processed');
                  Get.to(const PaymentPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFD8F02), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Curved edges
                  ),
                ),
                child: const Text(
                  "Pay",
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
