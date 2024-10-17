// import 'package:flutter/material.dart';

// class BigCard extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final Color bgColor;
//   //final double width; // Custom width parameter
//   final VoidCallback onTap; // Add onTap parameter

//   const BigCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgColor,
//     // required this.width,
//     required this.onTap, // Make onTap required
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Handle tap event
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: SizedBox(
//           width: 225, // Set the width for the big card
//           height: 150, // Define the height explicitly to avoid layout issues
//           child: Stack(
//             children: [
//               // Background with border radius
//               Container(
//                 decoration: BoxDecoration(
//                   color: bgColor,
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
//                 child: Image.network(
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

// // Big Card Class
// class BigCard extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final Color bgColor;
//   final VoidCallback onTap;

//   const BigCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgColor,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 225, // Width for the big card
//         height: 150, // Adjusted height for the big card
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Image covering the upper portion of the card
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//                 child: Image.network(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Centered title positioned below the image
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center, // Center the text
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black, // Ensure title is visible
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// // Big Card Class
// class BigCard extends StatelessWidget {
//   final String title;
//   final String imagePath; // Image path from the database
//   final String bgImage; // Background image for the card
//   final VoidCallback onTap;

//   const BigCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgImage, // Change from bgColor to backgroundImage
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 225, // Width for the big card
//         height: 150, // Adjusted height for the big card
//         decoration: BoxDecoration(
//           // Set the background image instead of color
//           image: DecorationImage(
//             image: NetworkImage(bgImage), // Background image
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Image covering the upper portion of the card
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//                 child: Image.network(
//                   imagePath, // Image path from the database
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Centered title positioned below the image
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center, // Center the text
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black, // Ensure title is visible
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// // Big Card Class
// class BigCard extends StatelessWidget {
//   final String title;
//   final String imagePath; // Image path from the database
//   final String bgImage; // Background image for the card
//   final VoidCallback onTap;

//   const BigCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgImage,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 225, // Width for the big card
//         height: 150, // Adjusted height for the big card
//         decoration: BoxDecoration(
//           // Set the background image instead of color
//           image: DecorationImage(
//             image: AssetImage(bgImage), // Use AssetImage for local assets
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Image covering the upper portion of the card
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
//                   child: Image.network(
//                     imagePath, // Use AssetImage for local images
//                     height: 130, width: 225,
//                   ),
//                 ),
//               ),
//             ),
//             // Centered title positioned below the image
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center, // Center the text
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black, // Ensure title is visible
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Big Card Class
class BigCard extends StatelessWidget {
  final String title;
  final String imagePath; // Image path from the database
  final String bgImage; // Background image for the card
  final VoidCallback onTap;

  const BigCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 225, // Width for the big card
        height: 150, // Adjusted height for the big card
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
            // Image covering the upper portion of the card
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
                    width: 225,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Centered title positioned below the image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center, // Center the text
                style: const TextStyle(
                  fontSize: 18,
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
