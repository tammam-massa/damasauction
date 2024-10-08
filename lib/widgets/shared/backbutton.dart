import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
          onPressed: Get.back,
        ),
        const Text('Back', style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
