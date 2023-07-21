import 'package:flutter/material.dart';

import '../../view/screens/edite_profile/edite_profile_details_screen.dart';
import '../../view/screens/home/home_screen.dart';
import '../../view/screens/home_layout/home_layout.dart';
import '../../view/screens/lang/lang_screen.dart';
import '../../view/screens/login/login_screen.dart';
import '../../view/screens/product_details.dart/product_details_screen.dart';
import '../../view/screens/settings/setting_screen.dart';
import '../../view/screens/user_order/user_order_screen.dart';
import '../../view/screens/user_profile/user_profile_screen.dart';

class RouterManager {
  static const String loginScreenRoute = '/login_screen';
  static const String homeLayoutScreenRoute = '/home_layout_screen';
  static const String homeScreenRoute = '/home_screen';
  static const String userProfileScreenRoute = '/user_profile_screen';
  static const String userCartScreenRoute = '/cart_screen';
  static const String productDetailsScreenRoute = '/product_details_screen';
  static const String userProfileDetailsScreenRoute =
      '/user_profile_details_screen';
  static const String langSectionScreenRoute = '/lang_section_screen';
  static const String settingsSectionScreenRoute = '/settings_section_screen';

  static generateRoute(String routeString) {
    switch (routeString) {
      case loginScreenRoute:
        return LoginScreen();
      case homeScreenRoute:
        return HomeScreen(
          key: const PageStorageKey('homePage'),
        );
      case userProfileScreenRoute:
        return const UserProfileScreen(
          key: PageStorageKey('profilePage'),
        );
      case productDetailsScreenRoute:
        return const ProductDetailsScreen();
      case userCartScreenRoute:
        return const UserOrderScreen(
          key: PageStorageKey('orderPage'),
        );
      case userProfileDetailsScreenRoute:
        return const UserProfileDetailsScreen();
      case langSectionScreenRoute:
        return const LangSectionScreen();

      case settingsSectionScreenRoute:
        return const SettingsSectionScreen();

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
    langSectionScreenRoute: (context) => const LangSectionScreen(),
    settingsSectionScreenRoute: (context) => const SettingsSectionScreen(),
  };
}
