import 'dart:convert';

import '../../../model/product.dart';
import 'package:http/http.dart';

import '../../../utils/urls.dart';
import 'product_repo.dart';

class ProductRepoImp implements IProductRepository {
  @override
  Future<List<Product>> getAllProducts() async {
    try {
      Response response = await get(Uri.parse(ApiHelper.allProducts));

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);

        List<Product> productsList = decodedResponse
            .map((product) => Product.fromJson(product))
            .toList();

        return productsList;
      } else {
        throw Exception('erro happend when fatching data');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<String>> getAllProductsCategories() {
    // TODO: implement getAllProductsCategories
    throw UnimplementedError();
  }
}
