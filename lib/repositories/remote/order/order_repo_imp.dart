import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../model/order.dart';
import '../../../utils/constants.dart';
import 'order_repo.dart';

class OrderRepoImp extends IOrderRepo {
  @override
  Future<Order> getUserOrder() async {
    try {
      String response = await rootBundle.loadString(AssetManager.orderJson);
      Map<String, dynamic> decodedResponse = jsonDecode(response);
      Order userCarts = Order.fromMap(decodedResponse);

      return userCarts;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
