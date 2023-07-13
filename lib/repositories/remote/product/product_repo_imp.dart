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

      List<dynamic> decodedResponse = jsonDecode(response.body);

      List<Product> productsList =
          decodedResponse.map((product) => Product.fromJson(product)).toList();
      print(productsList);

      return productsList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
