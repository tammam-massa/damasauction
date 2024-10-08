import 'package:damasauction/temporary%20files/carslistingpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back press
          },
        ),
        title: const Text('Construction'),
        actions: const [
          Icon(Icons.notifications), // Or another icon as per your design
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Paid Ad Section
              const Center(
                child: Text(
                  'Paid Ad',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/banner1.jpg', // Replace with your ad banner
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Advert by Type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildAdvertTypeButton('Displayed services'),
                  buildAdvertTypeButton('Required services'),
                ],
              ),
              const SizedBox(height: 20),

              // Subcategories Section
              const Text(
                'Subcategories',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildSubcategoryCard(
                      'See all 3001 ads', 'assets/images/lands.png'),
                  buildSubcategoryCard(
                      'Building & Construction', 'assets/images/lands.png'),
                  buildSubcategoryCard(
                      'Building Materials', 'assets/images/lands.png'),
                  buildSubcategoryCard(
                      'Engineering & Design', 'assets/images/lands.png'),
                  buildSubcategoryCard(
                      'Marble & Stone', 'assets/images/lands.png'),
                  buildSubcategoryCard(
                      'Building Tools', 'assets/images/lands.png'),
                ],
              ),
              const SizedBox(height: 20),

              // Companies Section
              const Text(
                'Companies',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildCompanyCard(
                      'Nodor Alshamal', 'assets/images/lands.png', 34, 19666),
                  buildCompanyCard('International Skills',
                      'assets/images/lands.png', 15, 52470),
                  buildCompanyCard('Sibrek Constructions',
                      'assets/images/lands.png', 8, 9602),
                  buildCompanyCard(
                      'Emar Aldar', 'assets/images/lands.png', 9, 31361),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Advert Type buttons
  Widget buildAdvertTypeButton(String text) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
        Get.to(const CarsListingPage());
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(text),
    );
  }

  // Widget for Subcategory cards
  Widget buildSubcategoryCard(String title, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 50, height: 50), // Subcategory image
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Widget for Company cards
  Widget buildCompanyCard(
      String name, String logoPath, int flagCount, int adCount) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(logoPath, width: 50, height: 50), // Company logo
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$flagCount flags',
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
            Text(
              '$adCount Ads',
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
