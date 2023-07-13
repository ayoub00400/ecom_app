import '../../../model/order.dart';

abstract class IOrderRepo {
  Future<Order> getUserOrder();
}
