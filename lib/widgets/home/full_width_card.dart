// import 'package:flutter/material.dart';

// class FullWidthCard extends StatelessWidget {
//   final String title;
//   final String imagePath;

//   final double width; // Custom width parameter
//   final VoidCallback onTap; // Add onTap parameter

//   const FullWidthCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.width,
//     required this.onTap, // Make onTap required
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Handle tap event
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: SizedBox(
//           width: 390, // Set the width for the full-width card
//           height: 140, // Define the height explicitly to avoid layout issues
//           child: Stack(
//             children: [
//               // Background with border radius
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               // Positioned text in the top-left corner
//               Positioned(
//                 top: 2,
//                 right: 4,
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               // Positioned image in the extreme bottom-right corner
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Image.asset(
//                   imagePath,
//                   height: 70, // Adjust the height as necessary
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class FullWidthCard extends StatelessWidget {
//   final String title;
//   final String imagePath; // Image path from the database
//   final String bgImage; // Background image for the card
//   final VoidCallback onTap; // Add onTap parameter

//   const FullWidthCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgImage, // Add backgroundImage parameter
//     required this.onTap, // Make onTap required
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Handle tap event
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: SizedBox(
//           width: 390, // Set the width for the full-width card
//           height: 140, // Define the height explicitly to avoid layout issues
//           child: Stack(
//             children: [
//               // Background with a border radius and image
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: NetworkImage(bgImage), // Set the background image
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Positioned text in the top-left corner
//               Positioned(
//                 top: 2,
//                 right: 4,
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Colors
//                         .white, // Optional: Make title visible over background
//                   ),
//                 ),
//               ),
//               // Positioned image in the extreme bottom-right corner
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Image.network(
//                   // Changed from Image.asset to Image.network for consistency
//                   imagePath,
//                   height: 70, // Adjust the height as necessary
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class FullWidthCard extends StatelessWidget {
//   final String title;
//   final String imagePath; // Image path from the database
//   final String bgImage; // Background image for the card
//   final VoidCallback onTap; // Add onTap parameter

//   const FullWidthCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgImage, // Add backgroundImage parameter
//     required this.onTap, // Make onTap required
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Handle tap event
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: SizedBox(
//           width: 390, // Set the width for the full-width card
//           height: 140, // Define the height explicitly to avoid layout issues
//           child: Stack(
//             children: [
//               // Background with a border radius and image
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image:
//                         AssetImage(bgImage), // Use AssetImage for local assets
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Positioned text in the top-left corner
//               Positioned(
//                 top: 2,
//                 right: 4,
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color:
//                         Colors.white, // Ensure title is visible over background
//                   ),
//                 ),
//               ),
//               // Positioned image in the extreme bottom-right corner
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Image.network(
//                   // Use Image.asset for local image assets
//                   imagePath,
//                   height: 70, // Adjust the height as necessary
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import CachedNetworkImage

class FullWidthCard extends StatelessWidget {
  final String title;
  final String imagePath; // Image path from the database
  final String bgImage; // Background image for the card
  final VoidCallback onTap; // Add onTap parameter

  const FullWidthCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgImage, // Background image
    required this.onTap, // Make onTap required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          width: 390, // Set the width for the full-width card
          height: 140, // Define the height explicitly to avoid layout issues
          child: Stack(
            children: [
              // Background with a border radius and image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:
                        AssetImage(bgImage), // Use AssetImage for local assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Positioned text in the top-left corner
              Positioned(
                top: 2,
                right: 4,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color:
                        Colors.white, // Ensure title is visible over background
                  ),
                ),
              ),
              // Positioned image in the extreme bottom-right corner
              Positioned(
                bottom: 0,
                left: 0,
                child: CachedNetworkImage(
                  imageUrl: imagePath, // Use CachedNetworkImage for caching
                  height: 70, // Adjust the height as necessary
                  placeholder: (context, url) => Center(
                      child:
                          CircularProgressIndicator()), // Placeholder while loading
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error), // Error widget
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
