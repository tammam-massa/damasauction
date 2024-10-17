// // // import 'package:flutter/material.dart';

// // // // Standard Card Class
// // // class StandardCard extends StatelessWidget {
// // //   final String title;
// // //   final String imagePath;
// // //   final Color bgColor;
// // //   final VoidCallback onTap;

// // //   const StandardCard({
// // //     super.key,
// // //     required this.title,
// // //     required this.imagePath,
// // //     required this.bgColor,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return InkWell(
// // //       onTap: onTap,
// // //       borderRadius: BorderRadius.circular(
// // //           10), // Ensure ripple effect fits the rounded edges
// // //       child: Container(
// // //         width: 110,
// // //         height: 150,
// // //         decoration: BoxDecoration(
// // //           color: bgColor, // Set background color
// // //           borderRadius: BorderRadius.circular(10),
// // //         ),
// // //         child: Stack(
// // //           children: [
// // //             // Positioned image at the bottom-right corner
// // //             Positioned(
// // //               bottom: 0,
// // //               left: 0,
// // //               child: standardCardImage(imagePath),
// // //             ),
// // //             // Positioned title at the top
// // //             Padding(
// // //               padding: const EdgeInsets.all(8.0),
// // //               child: standardCardTitle(title),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget standardCardImage(String imagePath) {
// // //     return ClipRRect(
// // //       borderRadius: BorderRadius.circular(10), // Add rounding to the image
// // //       child: Image.network(
// // //         imagePath,
// // //         // width: 80, // Adjust the width as needed
// // //         height: 70, // Adjust the height as needed
// // //         fit: BoxFit.cover,
// // //       ),
// // //     );
// // //   }

// // //   Widget standardCardTitle(String title) {
// // //     return Text(
// // //       title,
// // //       style: const TextStyle(
// // //         fontSize: 16,
// // //         fontWeight: FontWeight.bold,
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // // Standard Small Card Class
// // class StandardCard extends StatelessWidget {
// //   final String title;
// //   final String imagePath;
// //   final Color bgColor;
// //   final VoidCallback onTap;

// //   const StandardCard({
// //     super.key,
// //     required this.title,
// //     required this.imagePath,
// //     required this.bgColor,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onTap,
// //       borderRadius: BorderRadius.circular(10),
// //       child: Container(
// //         width: 110, // Width for the small card
// //         height: 150, // Height for the small card
// //         decoration: BoxDecoration(
// //           color: bgColor,
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             // Image covering most of the card
// //             Expanded(
// //               child: ClipRRect(
// //                 borderRadius: const BorderRadius.only(
// //                   topLeft: Radius.circular(10),
// //                   topRight: Radius.circular(10),
// //                 ),
// //                 child: Image.network(
// //                   imagePath,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             // Centered title positioned below the image
// //             Padding(
// //               padding: const EdgeInsets.all(4.0),
// //               child: Text(
// //                 title,
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black, // Ensure title is visible
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // // Standard Small Card Class
// // class StandardCard extends StatelessWidget {
// //   final String title;
// //   final String imagePath; // Image path from the database
// //   final String bgImage; // Background image for the card
// //   final VoidCallback onTap;

// //   const StandardCard({
// //     super.key,
// //     required this.title,
// //     required this.imagePath,
// //     required this.bgImage, // Change from bgColor to backgroundImage
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onTap,
// //       borderRadius: BorderRadius.circular(10),
// //       child: Container(
// //         width: 110, // Width for the small card
// //         height: 150, // Height for the small card
// //         decoration: BoxDecoration(
// //           // Set the background image instead of color
// //           image: DecorationImage(
// //             image: NetworkImage(bgImage), // Background image
// //             fit: BoxFit.cover,
// //           ),
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             // Image covering most of the card
// //             Expanded(
// //               child: ClipRRect(
// //                 borderRadius: const BorderRadius.only(
// //                   topLeft: Radius.circular(10),
// //                   topRight: Radius.circular(10),
// //                 ),
// //                 child: Image.network(
// //                   imagePath, // Image path from the database
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             // Centered title positioned below the image
// //             Padding(
// //               padding: const EdgeInsets.all(4.0),
// //               child: Text(
// //                 title,
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black, // Ensure title is visible
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// // Standard Small Card Class
// class StandardCard extends StatelessWidget {
//   final String title;
//   final String imagePath; // Image path from the database
//   final String bgImage; // Background image for the card
//   final VoidCallback onTap;

//   const StandardCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.bgImage, // Background image
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         width: 110, // Width for the small card
//         height: 150, // Height for the small card
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
//             // Image covering most of the card
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
//                     height: 130, width: 110,
//                   ),
//                 ),
//               ),
//             ),
//             // Centered title positioned below the image
//             Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 14,
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
