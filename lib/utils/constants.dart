import '../repositories/remote/product/product_repo_imp.dart';
import '../repositories/remote/user/user_repo_imp.dart';

class AssetManager {
  static String rootFolderName = 'assets/imgs';

  static final String loginImg = '$rootFolderName/login_.jpg';
  static final String profileImg = '$rootFolderName/avatar.jpg';
}

class Constants {}

var UserApiRepo = UserRepoImp();
var ProductApiRepo = ProductRepoImp();
