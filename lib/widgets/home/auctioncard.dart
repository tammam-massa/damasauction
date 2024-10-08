//Auction Card

import 'package:flutter/material.dart';

class AuctionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final int auctionNumber;
  final String price;
  final IconData timeIcon;
  final IconData auctionIcon;
  final IconData priceIcon;
  final Color timeColor;
  final Color auctionIconColor;
  final Color priceIconColor;

  const AuctionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.auctionNumber,
    required this.price,
    this.timeIcon = Icons.access_time, // Default time icon
    this.auctionIcon = Icons.gavel, // Default auction hammer icon
    this.priceIcon = Icons.attach_money, // Default price icon
    this.timeColor = Colors.red, // Default time color
    this.auctionIconColor = Colors.grey, // Default auction icon color
    this.priceIconColor = Colors.grey, // Default price icon color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagePath, // Dynamic image path
              width: 164, // Adjust width to fill container
              height: 164,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 164, // Adjust width to fill container
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title, // Dynamic title
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(timeIcon,
                        color: timeColor, size: 20), // Dynamic time icon
                    const SizedBox(width: 8),
                    Text(
                      time, // Dynamic time
                      style: TextStyle(
                        color: timeColor, // Dynamic color for time
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(auctionIcon,
                        color: auctionIconColor,
                        size: 20), // Dynamic auction icon
                    const SizedBox(width: 8),
                    Text(
                      auctionNumber.toString(), // Dynamic auction number
                      style: TextStyle(
                        color:
                            auctionIconColor, // Dynamic color for auction icon
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(priceIcon,
                        color: priceIconColor, size: 20), // Dynamic price icon
                    const SizedBox(width: 8),
                    Text(
                      price, // Dynamic price
                      style: TextStyle(
                        color: priceIconColor, // Dynamic color for price
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
