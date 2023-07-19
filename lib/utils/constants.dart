import '../repositories/remote/order/order_repo_imp.dart';
import '../repositories/remote/product/product_repo_imp.dart';
import '../repositories/remote/user/user_repo_imp.dart';

class AssetManager {
  static String imagesDir = 'assets/imgs';
  static String dataDir = 'assets/data';

  static final String loginImg = '$imagesDir/login_.jpg';
  static final String profileImg = '$imagesDir/avatar.jpg';
  static final String orderJson = '$dataDir/order.json';
}

class Constants {
  // TODO : remove repos from here
  static var userApiRepo = UserRepoImp();
  static var productApiRepo = ProductRepoImp();
  static var orderApiRepo = OrderRepoImp();

  static const double smallPadding = 8;
  static const double mediumePadding = 16;
  static const double largePadding = 32;
}
