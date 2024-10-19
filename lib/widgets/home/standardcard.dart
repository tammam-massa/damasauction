import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Standard Small Card Class
class StandardCard extends StatelessWidget {
  final String title;
  final String imagePath; // Image path from the database
  final String bgImage; // Background image for the card
  final VoidCallback onTap;

  const StandardCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgImage, // Background image
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 110, // Width for the small card
        height: 150, // Height for the small card
        decoration: BoxDecoration(
          // Set the background image instead of color
          image: DecorationImage(
            image: AssetImage(bgImage), // Use AssetImage for local assets
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image covering most of the card
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: CachedNetworkImage(
                    imageUrl: imagePath, // Use CachedNetworkImage for caching
                    placeholder: (context, url) => Center(
                        child:
                            CircularProgressIndicator()), // Placeholder while loading
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error), // Error widget
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Centered title positioned below the image
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Ensure title is visible
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
