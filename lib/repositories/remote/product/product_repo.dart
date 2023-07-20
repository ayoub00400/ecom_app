import '../../../model/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();

  Future<List<Product>> getProductsByCategory(String category);

  Future<List<String>> getAllCategories();
}
