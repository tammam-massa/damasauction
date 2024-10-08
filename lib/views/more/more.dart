import 'package:damasauction/views/languages/language.dart';
import 'package:damasauction/widgets/more/more_divider.dart';
import 'package:damasauction/widgets/more/more_element.dart';
import 'package:damasauction/widgets/more/more_section.dart';
import 'package:damasauction/widgets/shared/warning_dialoug.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});
  final WarningDialog warningDialog = WarningDialog(); // Instantiate the dialog

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This hides the back arrow
        title: Center(child: Text('more'.tr)), // Updated for translation
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
            MoreSection(
              title: "main_actions".tr, // Updated for translation
              items: [
                MoreElement(
                  title: 'add_advertise'.tr, // Updated for translation
                  icon: Icons.add,
                  iconColor: const Color(0xff4ED56D),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'ads'.tr, // Updated for translation
                  icon: Icons.list_alt,
                  iconColor: const Color(0xffF6962F),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'favorite'.tr, // Updated for translation
                  icon: Icons.favorite,
                  iconColor: const Color(0xffFA362B),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'blocked_users'.tr, // Updated for translation
                  icon: Icons.block,
                  iconColor: const Color(0xff34A7D7),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'chat'.tr, // Updated for translation
                  icon: Icons.chat,
                  iconColor: const Color(0xffA32B63),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
              ],
            ),

            const MoreDivider(), // Separator between sections

            // Section 2: Account and Payment
            MoreSection(
              title: "account_payment".tr, // Updated for translation
              items: [
                MoreElement(
                  title: 'bidding_credit'.tr, // Updated for translation
                  icon: Icons.credit_card,
                  iconColor: const Color(0xffCE77E0),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'paid_packages'.tr, // Updated for translation
                  icon: Icons.attach_money,
                  iconColor: const Color(0xffF3D139),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'promoted_ads'.tr, // Updated for translation
                  icon: Icons.trending_up,
                  iconColor: const Color(0xff4ED56D),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'bank_account_details'.tr, // Updated for translation
                  icon: Icons.account_balance,
                  iconColor: const Color(0xff8F8F91),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
              ],
            ),

            const MoreDivider(), // Separator between sections

            // Section 3: Support and Settings
            MoreSection(
              title: "support_settings".tr, // Updated for translation
              items: [
                MoreElement(
                  title:
                      'support_chat_help_center'.tr, // Updated for translation
                  icon: Icons.support,
                  iconColor: const Color(0xffF6962F),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: "language".tr,
                  icon: Icons.language,
                  iconColor: const Color(0xff4DDB68),
                  onTap: () {
                    Get.to(() => const LanguageSelectionScreen());
                  },
                ),
                MoreElement(
                  title: 'change_mode'.tr, // Updated for translation
                  icon: Icons.brightness_6,
                  iconColor: const Color(0xffFA362B),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
              ],
            ),

            const MoreDivider(), // Separator between sections

            // Section 4: App Information
            MoreSection(
              title: "app_information".tr, // Updated for translation
              items: [
                MoreElement(
                  title: 'about_mzad_dimashq'.tr, // Updated for translation
                  icon: Icons.info,
                  iconColor: const Color(0xffFD8F02),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'share_mzad_dimashq'.tr, // Updated for translation
                  icon: Icons.share,
                  iconColor: const Color(0xffA32B63),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'rate_mzad_dimashq_app'.tr, // Updated for translation
                  icon: Icons.star_rate,
                  iconColor: const Color(0xff34A7D7),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'privacy_policy'.tr, // Updated for translation
                  icon: Icons.privacy_tip,
                  iconColor: const Color(0xffCE77E0),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'terms_of_use'.tr, // Updated for translation
                  icon: Icons.gavel,
                  iconColor: const Color(0xffF3D139),
                  onTap: () {
                    // Add your onTap action here
                  },
                ),
                MoreElement(
                  title: 'logout'.tr, // Updated for translation
                  icon: Icons.logout,
                  iconColor: const Color(0xff8F8F91),
                  onTap: () {
                    // Perform logout action
                    warningDialog.showWarningDialog(
                      context,
                      "warning".tr, // Updated for translation
                      "do_you_want_to_exit_from_mzad_dimashq"
                          .tr, // Updated for translation
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
