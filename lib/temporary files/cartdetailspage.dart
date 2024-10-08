import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Ad Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () {
              // Add to favorites logic
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Add to favorites'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Ad Section with a loading indicator
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),

            // Comments Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comments(1)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('أبو عبدالرحمن'),
                    subtitle: Text('3 days ago\nفيها حوادث'),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter comment here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Comment post logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text('Comment'),
                  ),
                ],
              ),
            ),

            // Share button
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  // Share logic
                },
                backgroundColor: Colors.purple,
                child: const Icon(Icons.share),
              ),
            ),

            // Related Ads Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Related ads',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        relatedAdItem(context, 'for sale', '105000 QAR'),
                        relatedAdItem(context, 'Toyota LX LC79', '185000 QAR'),
                        relatedAdItem(context, 'Another Ad', '170000 QAR'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Product Details Section
            productDetails(context),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget relatedAdItem(BuildContext context, String title, String price) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/150',
              height: 80,
              width: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(price,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              title: const Text('Samir Yahia'),
              subtitle: const Text('Followers: 14\n+974 55909799'),
              trailing: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Follow logic
                    },
                    child: const Text('Follow'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Contact logic
                    },
                    child: const Text('Contact'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GXR 2018 ORIGINAL PAINT'),
                  Text('169,000 QAR',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('2 weeks ago · 5573 views'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildBottomBarItem(Icons.call, 'Call', Colors.green),
          buildBottomBarItem(Icons.message, 'SMS', Colors.blue),
          buildBottomBarItem(Icons.chat, 'Chat', Colors.red),
          buildBottomBarItem(Icons.import_contacts, 'WhatsApp', Colors.green),
        ],
      ),
    );
  }

  Widget buildBottomBarItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}
