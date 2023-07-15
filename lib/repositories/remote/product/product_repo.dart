import '../../../model/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();
  //TODO:for Future if need to load product in cart screen
  //getProductById();

  Future<List<String>> getAllProductsCategories();
}
