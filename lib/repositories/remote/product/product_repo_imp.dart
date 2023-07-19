import 'dart:convert';

import 'package:http/http.dart';

import '../../../model/product.dart';
import '../../../utils/urls.dart';
import 'product_repo.dart';

class ProductRepoImp implements IProductRepository {
  @override
  Future<List<Product>> getAllProducts() async {
    try {
      // TODO : replace it with http.get
      Response response = await get(Uri.parse(ApiHelper.allProducts));

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);

        List<Product> productsList = decodedResponse.map((product) => Product.fromJson(product)).toList();

        return productsList;
      } else {
        throw Exception('erro happend when fatching data');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<String>> getAllProductsCategories() async {
    try {
      Response response = await get(Uri.parse(ApiHelper.allCategories));

      if (response.statusCode == 200) {
        List<String> categories = (jsonDecode(response.body) as List).cast<String>();

        return categories;
      } else {
        throw Exception('erro happend when fatching categories');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<Product>> getCategoryProducts(String category) async {
    try {
      Response response = await get(Uri.parse(ApiHelper.getProductByCat + category));

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);
        List<Product> productsList = decodedResponse.map((product) => Product.fromJson(product)).toList();
        return productsList;
      } else {
        throw Exception('erro happend when fatching categories');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
