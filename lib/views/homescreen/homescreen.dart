import 'package:damasauction/core/services.dart';
import 'package:damasauction/views/ads/chooese_ads_category_step1.dart';
import 'package:damasauction/views/bidding/biddingpage.dart';
import 'package:damasauction/views/home/home.dart';
import 'package:damasauction/views/homescreen/cutommenuitem.dart';
import 'package:damasauction/views/more/more.dart';
import 'package:damasauction/views/profile/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  MyServices myServices = Get.find();
  int _selectedIndex = 0;
  String? token;

  @override
  void initState() {
    super.initState();
    token = myServices.sharedPreferences.getString("access_token");
  }

  final List<Widget> _pages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pages.addAll([
      const HomePage(),
      const BiddingPage(),
      Container(),
      ProfilePage(token: token ?? ''),
      MorePage(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/images/box.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 111,
                ),
                Image.asset(
                  getDarkModeBoxImage(),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 106,
                ),
                Positioned(
                  bottom: 50,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const ChooseAdsCategoryPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: getDarkModeBoxConatiner(),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: getDarkModeBoxBasket(),
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 22,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: CustomMenuItem(
                          isSelected: _selectedIndex == 0,
                          icon: Icons.home_outlined,
                          title: 'Home', // Add title
                          onTap: () => _onItemTapped(0),
                        ),
                      ),
                      Flexible(
                        child: CustomMenuItem(
                          isSelected: _selectedIndex == 1,
                          icon: Icons.gavel_outlined,
                          title: 'Bidding', // Add title
                          onTap: () => _onItemTapped(1),
                        ),
                      ),
                      const SizedBox(width: 40), // Space for the center button
                      Flexible(
                        child: CustomMenuItem(
                          isSelected: _selectedIndex == 3,
                          icon: Icons.person_outline,
                          title: 'My ads', // Add title
                          onTap: () => _onItemTapped(3),
                        ),
                      ),
                      Flexible(
                        child: CustomMenuItem(
                          isSelected: _selectedIndex == 4,
                          icon: Icons.more_horiz_outlined,
                          title: 'More', // Add title
                          onTap: () => _onItemTapped(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getDarkModeBoxImage() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode
        ? 'assets/images/boxBlack.png' // Dark mode image path
        : 'assets/images/box.png'; // Light mode image path
  }

  Color? getDarkModeBoxConatiner() {
    bool isDarkmode = Theme.of(context).brightness == Brightness.dark;
    return isDarkmode ? Theme.of(context).primaryColor : Colors.pink;
  }

  Color? getDarkModeBoxBasket() {
    bool isDarkmode = Theme.of(context).brightness == Brightness.dark;
    return isDarkmode ? Colors.white : Colors.white;
  }
}
