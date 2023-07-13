import 'package:ecom_app/view/screens/user_profile_details/user_profile_details.dart';

import '../../view/screens/home/home_screen.dart';
import '../../view/screens/home_layout/home_layout.dart';
import '../../view/screens/login/login_screen.dart';
import '../../view/screens/product_details.dart/prduct_details_screen.dart';
import '../../view/screens/user_cart/user_cart_screen.dart';
import '../../view/screens/user_profile/user_profile_screen.dart';

class RouterManager {
  static const String loginScreenRoute = '/login_screen';
  static const String homeLayoutScreenRoute = '/home_layout_screen';
  static const String homeScreenRoute = '/home_screen';
  static const String userProfileScreenRoute = '/user_profile_screen';
  static const String userCartScreenRoute = '/cart_screen';
  static const String productDetailsScreenRoute = '/product_details_screen';
  static const String userProfileDetailsScreenRoute = '/user_profile_details_screen';

  static generateRoute(String routeString) {
    switch (routeString) {
      case loginScreenRoute:
        return LoginScreen();
      case homeScreenRoute:
        return HomeScreen();
      case userProfileScreenRoute:
        return UserProfileScreen();
      case productDetailsScreenRoute:
        return HomeScreen();
      case userCartScreenRoute:
        return UserCartScreen();
      case userProfileDetailsScreenRoute:
        return UserProfileDetailsScreen();

      default:
        LoginScreen();
    }
  }

  static final routes = {
    loginScreenRoute: (context) => LoginScreen(),
    homeLayoutScreenRoute: (context) => const HomeLayoutScreen(),
    homeScreenRoute: (context) => const HomeScreen(),
    userCartScreenRoute: (context) => LoginScreen(),
    userProfileScreenRoute: (context) => LoginScreen(),
    productDetailsScreenRoute: (context) => const ProductDetailsScreen(),
    userProfileDetailsScreenRoute: (context) => const UserProfileDetailsScreen(),
  };
}
