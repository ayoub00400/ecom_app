import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/product.dart';
import '../../../utils/urls.dart';
import 'product_repo.dart';

class ProductRepoImp implements IProductRepository {
  @override
  Future<List<Product>> getAllProducts() async {
    try {
      http.Response response = await http.get(Uri.parse(ApiHelper.allProducts));

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);

        List<Product> products = decodedResponse
            .map((product) => Product.fromJson(product))
            .toList();

        return products;
      } else {
        throw Exception('error happened when fetching categories');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<String>> getAllCategories() async {
    try {
      http.Response response =
          await http.get(Uri.parse(ApiHelper.allCategories));

      if (response.statusCode == 200) {
        List<String> categories =
            (jsonDecode(response.body) as List).cast<String>();

        return categories;
      } else {
        throw Exception('error happened when fetching categories');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      http.Response response =
          await http.get(Uri.parse(ApiHelper.getProductByCategory + category));

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);
        List<Product> products = decodedResponse
            .map((product) => Product.fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception('error happened when fetching categories');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
