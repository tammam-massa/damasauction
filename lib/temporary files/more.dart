import 'package:damasauction/controllers/more/more_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorePage extends StatelessWidget {
  final MoreControllerImp moreController = Get.put(MoreControllerImp());

  MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This hides the back arrow
        title: const Center(child: Text('More')),
        scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            onPressed: () {
              // Define what happens when the notification icon is pressed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1: Main Actions
            _buildSection(
              context,
              "Main Actions",
              [
                _buildListItem(
                    'Add Advertise', Icons.add, const Color(0xff4ED56D)),
                _buildListItem('Ads', Icons.list_alt, const Color(0xffF6962F)),
                _buildListItem(
                    'Favorite', Icons.favorite, const Color(0xffFA362B)),
                _buildListItem(
                    'Blocked Users', Icons.block, const Color(0xff34A7D7)),
                _buildListItem('Chat', Icons.chat, const Color(0xffA32B63)),
              ],
            ),

            _buildSeparator(), // Separator between sections

            // Section 2: Account and Payment
            _buildSection(
              context,
              "Account & Payment",
              [
                _buildListItem('Bidding Credit', Icons.credit_card,
                    const Color(0xffCE77E0)),
                _buildListItem('Paid Packages', Icons.attach_money,
                    const Color(0xffF3D139)),
                _buildListItem(
                    'Promoted Ads', Icons.trending_up, const Color(0xff4ED56D)),
                _buildListItem('Bank Account Details', Icons.account_balance,
                    const Color(0xff8F8F91)),
              ],
            ),

            _buildSeparator(), // Separator between sections

            // Section 3: Support and Settings
            _buildSection(
              context,
              "Support & Settings",
              [
                _buildListItem('Support Chat & Help Center', Icons.support,
                    const Color(0xffF6962F)),
                _buildListItem(
                    'Language', Icons.language, const Color(0xff4DDB68)),
                _buildListItem(
                    'Change Mode', Icons.brightness_6, const Color(0xffFA362B)),
              ],
            ),

            _buildSeparator(), // Separator between sections

            // Section 4: App Information
            _buildSection(
              context,
              "App Information",
              [
                _buildListItem(
                    'About Mzad Dimashq', Icons.info, const Color(0xffFD8F02)),
                _buildListItem(
                    'Share Mzad Dimashq', Icons.share, const Color(0xffA32B63)),
                _buildListItem('Rate Mzad Dimashq App', Icons.star_rate,
                    const Color(0xff34A7D7)),
                _buildListItem('Privacy Policy', Icons.privacy_tip,
                    const Color(0xffCE77E0)),
                _buildListItem(
                    'Terms of Use', Icons.gavel, const Color(0xffF3D139)),
                _buildListItem('Logout', Icons.logout, const Color(0xff8F8F91)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a section with a title and list of items
  Widget _buildSection(BuildContext context, String title, List<Widget> items) {
    return Container(
      color: Colors.white, // White background for each section
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (var i = 0; i < items.length; i++) ...[
          items[i],
          if (i != items.length - 1) // Check if it's not the last item
            const Padding(
              padding: EdgeInsets.fromLTRB(
                  10, 12, 10, 12), // Left: 10, Top: 12, Right: 10, Bottom: 12
              child: Divider(
                height: 1,
                thickness: 1,
                color: Color(0xffEEEEEE), // Light grey color for the line
              ),
            ),
        ]
// Divider with EEEEEE color
      ]),
    );
  }

  // Method to build each list item with icon inside a colored square, title, and suitable color
  Widget _buildListItem(String title, IconData icon, Color iconColor) {
    return ListTile(
        leading: Container(
          width: 40, // Smaller width for the icon container
          height: 40, // Smaller height for the icon container
          decoration: BoxDecoration(
            color: iconColor
                .withOpacity(0.8), // Darker background for the icon container
            borderRadius: BorderRadius.circular(8), // Curved edges
          ),
          child: Center(
            child: Icon(icon, color: Colors.white), // White icon color
          ),
        ),
        title: Text(title),
        //  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          Get.defaultDialog(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                // color: AppColor.primaryColor)
              ),
              // cancelTextColor: AppColor.secondColor,
              // confirmTextColor: AppColor.secondColor,
              buttonColor: const Color(0xffde358c),
              onCancel: () {},
              onConfirm: () {
                //  exit(0);
                moreController.logout();
              },
              title: "Warning",
              middleText: "Do you want to exit from Mzad Dimashq ".tr);
        }
        // Define actions for each item if necessary

        );
  }

  // Method to create a grey separator between sections
  Widget _buildSeparator() {
    return Container(
      height: 10,
      color: const Color(0xffEEEEEE), // Light grey separator
    );
  }
}
