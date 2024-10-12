import 'package:damasauction/views/homescreen/homescreen.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsSuccessPage extends StatefulWidget {
  const AdsSuccessPage({super.key});

  @override
  AdsSuccessPageState createState() => AdsSuccessPageState();
}

class AdsSuccessPageState extends State<AdsSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Centered content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 80,
                      color: const Color(0xff358cde),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'تم اضافة اعلانك بنجاح',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff358cde),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Finish button at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ActionButton(
                  text: 'finish'.tr,
                  onPressed: () {
                    Get.to(const HomeScreen());
                  },
                  backgroundColor: const Color(0xff358cde),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
