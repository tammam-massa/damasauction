// Slider Widget (TPromeSlider)
import 'package:carousel_slider/carousel_slider.dart';
import 'package:damasauction/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromeSlider extends StatelessWidget {
  final String title;
  final List<String> banners;
  const TPromeSlider({super.key, required this.banners, required this.title});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller =
        Get.find<HomeControllerImp>(); // Use Get.find() instead of Get.put()
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              aspectRatio: 16 / 9,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                controller.updatePageIndicator(index);
              },
            ),
            items: banners.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      banner,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: TcircularContainer(
                    width: 12,
                    height: 12,
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? const Color(0xffFD8F02)
                        : const Color(0x80FD8F02),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// Circular Indicator Container
class TcircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  const TcircularContainer({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
