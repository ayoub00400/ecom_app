import '../../../model/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();

  Future<List<Product>> getCategoryProducts(String category);

  Future<List<String>> getAllProductsCategories();
}
