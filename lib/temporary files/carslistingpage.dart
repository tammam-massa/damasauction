import 'package:damasauction/temporary%20files/cartdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsListingPage extends StatelessWidget {
  const CarsListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toyota'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Filters Section
            buildFilters(),
            const SizedBox(height: 10),

            // Action Buttons: Sale, Required, Exchange, Services
            buildActionButtons(),
            const SizedBox(height: 10),

            // Paid Ad Section
            buildAdBanner(),
            const SizedBox(height: 10),

            // Grid Items (Page 1 and Page 2 Combined)
            buildGridItems(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Filters Section: All Filters, Motors: Toyota, Class
  Widget buildFilters() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: buildFilterButton('All Filters', Icons.filter_list)),
          Expanded(
              child: buildFilterButton('Motors: Toyota', Icons.directions_car)),
          Expanded(child: buildFilterButton('Class', Icons.category)),
        ],
      ),
    );
  }

  // Action Buttons: Sale, Required, Exchange, Services
  Widget buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildActionButton('Sale', Colors.red),
          buildActionButton('Required', Colors.grey),
          buildActionButton('Exchange', Colors.grey),
          buildActionButton('Services', Colors.grey),
        ],
      ),
    );
  }

  Widget buildActionButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            Get.to(const CarDetailsPage());
          },
          child: Text(text, style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }

  // Paid Ad Section
  Widget buildAdBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Image.asset('assets/images/ad_banner.png', fit: BoxFit.cover),
    );
  }

  // Grid Items for Ads
  Widget buildGridItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: 6, // Example item count; adjust based on your content
        itemBuilder: (context, index) {
          return buildGridItem();
        },
      ),
    );
  }

  Widget buildGridItem() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/car_example.jpg', // Replace with actual car image
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Featured',
                    style: TextStyle(color: Colors.orange, fontSize: 12)),
                SizedBox(height: 4),
                Text('Land Cruiser 2020',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('185,000 QAR'),
                SizedBox(height: 4),
                Text('227,000 Km',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: CarsListingPage()));
}

Widget buildFilters() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(child: buildFilterButton('All Filters', Icons.filter_list)),
        Expanded(
            child: buildFilterButton('Motors: Toyota', Icons.directions_car)),
        Expanded(child: buildFilterButton('Class', Icons.category)),
      ],
    ),
  );
}

Widget buildFilterButton(String text, IconData icon) {
  return OutlinedButton.icon(
    icon: Icon(icon, size: 18),
    label: Text(text, style: const TextStyle(fontSize: 12)),
    onPressed: () {},
  );
}

Widget buildAdBanner() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Image.asset('assets/images/ad_banner.png', fit: BoxFit.cover),
  );
}

Widget buildGridItems() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return buildGridItem();
      },
    ),
  );
}

Widget buildGridItem() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/car_example.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Featured',
                  style: TextStyle(color: Colors.orange, fontSize: 12)),
              SizedBox(height: 4),
              Text('Land Cruiser 2020',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('185,000 QAR'),
              SizedBox(height: 4),
              Text('227,000 Km',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    ),
  );
}
