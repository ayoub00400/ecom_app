import '../../view/screens/home/home_screen.dart';
import '../../view/screens/home_layout/home_layout.dart';
import '../../view/screens/login/login_screen.dart';
import '../../view/screens/product_details.dart/prduct_details_screen.dart';
import '../../view/screens/user_order/user_order_screen.dart';
import '../../view/screens/user_profile/user_profile_screen.dart';
import '../../view/screens/user_profile_details/user_profile_details.dart';

class RouterManager {
  static const String loginScreenRoute = '/login_screen';
  static const String homeLayoutScreenRoute = '/home_layout_screen';
  static const String homeScreenRoute = '/home_screen';
  static const String userProfileScreenRoute = '/user_profile_screen';
  static const String userCartScreenRoute = '/cart_screen';
  static const String productDetailsScreenRoute = '/product_details_screen';
  static const String userProfileDetailsScreenRoute =
      '/user_profile_details_screen';

  static generateRoute(String routeString) {
    switch (routeString) {
      case loginScreenRoute:
        return LoginScreen();
      case homeScreenRoute:
        return HomeScreen();
      case userProfileScreenRoute:
        return const UserProfileScreen();
      case productDetailsScreenRoute:
        return HomeScreen();
      case userCartScreenRoute:
        return const UserOrderScreen();
      case userProfileDetailsScreenRoute:
        return const UserProfileDetailsScreen();

      default:
        LoginScreen();
    }
  }

  static final routes = {
    loginScreenRoute: (context) => LoginScreen(),
    homeLayoutScreenRoute: (context) => const HomeLayoutScreen(),
    homeScreenRoute: (context) => HomeScreen(),
    userCartScreenRoute: (context) => const UserOrderScreen(),
    userProfileScreenRoute: (context) => LoginScreen(),
    productDetailsScreenRoute: (context) => const ProductDetailsScreen(),
    userProfileDetailsScreenRoute: (context) =>
        const UserProfileDetailsScreen(),
  };
}
