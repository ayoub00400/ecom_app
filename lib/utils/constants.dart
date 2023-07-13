import '../repositories/remote/order/order_repo_imp.dart';

import '../repositories/remote/product/product_repo_imp.dart';
import '../repositories/remote/user/user_repo_imp.dart';

class AssetManager {
  static String rootImagesFolderName = 'assets/imgs';
  static String rootDataFolderName = 'assets/data';

  static final String loginImg = '$rootImagesFolderName/login_.jpg';
  static final String profileImg = '$rootImagesFolderName/avatar.jpg';
  static final String orderJson = '$rootDataFolderName/order.json';
}

class Constants {}

var userApiRepo = UserRepoImp();
var productApiRepo = ProductRepoImp();
var orderApiRepo = OrderRepoImp();
