import 'package:damasauction/core/functions/fetchcategory.dart';
import 'package:damasauction/views/ads/choose_ads_info_step2.dart';
import 'package:damasauction/widgets/ads/category_ad_name.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:damasauction/widgets/shared/custom_snackbar.dart';
import 'package:damasauction/widgets/shared/searchbartop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAdsCategoryPage extends StatefulWidget {
  const ChooseAdsCategoryPage({super.key});

  @override
  ChooseAdsCategoryPageState createState() => ChooseAdsCategoryPageState();
}

class ChooseAdsCategoryPageState extends State<ChooseAdsCategoryPage>
    with SingleTickerProviderStateMixin {
  String? _selectedCategoryName;
  int? _selectedCategoryId;
  List<dynamic> categories = [];
  bool _isLoading = true; // Loading state variable
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _fetchCategories(); // Fetch categories when the widget initializes
    _initializeAnimation(); // Initialize animation controller
  }

  Future<void> _fetchCategories() async {
    // Fetch categories and update the state
    categories = await fetchCategories();
    setState(() {
      _isLoading = false; // Set loading to false once data is fetched
    });
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 0.33).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: const Color(0xFFf3f3f3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
          onPressed: () {
            Get.back(); // Handle back action
          },
        ),
        title: Text(
          'back'.tr,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _animationController!,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    minHeight: 10,
                    value: _animation?.value,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff358cde)),
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                "step 1".tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'choose_category'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SearchBarTop(
                hint: 'search'.tr,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        children: categories.map((category) {
                          String categoryName =
                              category['name'] ?? 'unknown_category'.tr;
                          int? categoryId = category['category_id'];

                          if (categoryId != null) {
                            return CategoryAdName(
                              categoryName: categoryName,
                              categoryId: categoryId,
                              selectedCategoryId: _selectedCategoryId,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCategoryId = value;
                                  _selectedCategoryName = categoryName;
                                });
                              },
                            );
                          } else {
                            return Container();
                          }
                        }).toList(),
                      ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ActionButton(
                  text: 'next'.tr,
                  onPressed: () {
                    if (_selectedCategoryId != null) {
                      Get.to(ChooseAdsInfoPage(), arguments: {
                        'categoryId': _selectedCategoryId,
                        'categoryName': _selectedCategoryName,
                      });
                    } else {
                      CustomSnackbar.showSnackbar(
                          title: 'error',
                          message: 'please_select_a_category',
                          icon: Icons.error_outline);
                    }
                  },
                  backgroundColor: const Color(0xff358cde),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
