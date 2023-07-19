import 'package:ecom_app/repositories/remote/order/order_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/order.dart';
import '../../../../model/order_item.dart';
import 'user_order_state.dart';

class UserOrderCubit extends Cubit<UserCartState> {
  List<OrderItem> orderItems = [];
  double total = 0;

  final OrderRepoImp orderApiRepo = OrderRepoImp();
  UserOrderCubit() : super(UserCartInitial());

  Future<void> loadOrder() async {
    try {
      orderItems = [];
      emit(UserCartLoading());
      Order order = await orderApiRepo.getUserOrder();
      total = order.total!;
      orderItems = order.orderItems ?? [];
      emit(UserCartLoadingDone());
    } catch (e) {
      emit(UserCartLoadingFailed());
    }
  }

  void deleteAllItems() {
    orderItems = [];
    emit(OrderRemoverd());
  }

  void deleteSingleItem(int id) {
    orderItems.removeWhere((element) => element.id == id);
    emit(SingleItemRemoved());
  }
}
