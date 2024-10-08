import 'package:damasauction/core/middleware/mymiddleware.dart';
import 'package:damasauction/views/auth/loginpage.dart';
import 'package:damasauction/views/home/home.dart';
import 'package:damasauction/views/homescreen/homescreen.dart';
import 'package:damasauction/views/languages/language_selection_screen.dart';
import 'package:damasauction/views/more/more.dart';
import 'package:damasauction/views/splash/spalsh_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: "/",
        page: () => const LanguageSelectionScreenStarter(),
        middlewares: [MyMiddleWare()]),
    GetPage(
        name: '/languageselectionscreenstarter',
        page: () => const LanguageSelectionScreenStarter()),
    GetPage(name: '/login', page: () => LoginPage()), // Define login page route
    GetPage(
        name: '/home', page: () => const HomePage()), // Define home page route
    GetPage(
        name: '/splash',
        page: () => const SplashScreen()), // Define splash page route
    GetPage(name: '/homescreen', page: () => const HomeScreen()),
    GetPage(name: '/more', page: () => MorePage()),
    // GetPage(name: '/profile', page: () => ProfilePage()),
    // GetPage(name: '/editprofile', page: () => EditInfoPage()),
    // GetPage(name: '/bidding', page: () => BiddingPage()),
    // GetPage(name: '/refund', page: () => RefundRequestPage()),
    // GetPage(name: '/biddingcredit', page: () => BiddingCreditPage()),
    // GetPage(name: '/paymentmethod', page: () => PaymentMethodPage()),
    // GetPage(name: '/payment', page: () => PaymentPage()),
    // GetPage(name: '/choosectegory', page: () => ChooseCategoryPage()),
    // GetPage(name: '/chooseadinfo', page: () => ChooseAdInfoPage()),
    // GetPage(name: '/addetails', page: () => AdDetailsPage())
  ];
}
