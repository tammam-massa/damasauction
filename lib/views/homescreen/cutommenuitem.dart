// import 'package:flutter/material.dart';

// class CustomMenuItem extends StatelessWidget {
//   final bool isSelected;
//   final IconData icon;
//   final VoidCallback onTap;

//   const CustomMenuItem({
//     Key? key,
//     required this.isSelected,
//     required this.icon,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blueAccent : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.black,
//               size: 28,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               isSelected
//                   ? "Selected"
//                   : "Not Selected", // Replace with localization if needed
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.black,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class CustomMenuItem extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;

//   const CustomMenuItem({
//     Key? key,
//     required this.icon,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Icon(
//         icon,
//         size: 30, color: Colors.grey, // Adjust size as needed
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomMenuItem({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.blue : Colors.grey, // Icon color logic
          ),
          const SizedBox(height: 4), // Add some space between icon and text
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey, // Text color logic
              fontSize: 12, // Adjust font size as needed
            ),
          ),
        ],
      ),
    );
  }
}
