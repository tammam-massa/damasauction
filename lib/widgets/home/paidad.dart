import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaidAd extends StatelessWidget {
  final String bannerImage; // Path to the banner image

  const PaidAd({super.key, required this.bannerImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'paid ad'.tr,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 5),
          const Text(
            '',
            style: TextStyle(color: Color.fromARGB(255, 131, 100, 100)),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              bannerImage, // Use the image passed in the constructor
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 150, // Adjust height as necessary
            ),
          ),
        ],
      ),
    );
  }
}
