import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/order.dart';
import '../../../../model/order_item.dart';
import '../../../../utils/constants.dart';

import 'user_order_state.dart';

class UserOrderCubit extends Cubit<UserCartState> {
  List<OrderItem> orderItems = [];
  double total = 0;
  UserOrderCubit() : super(UserCartInitial());
  loadOrder() async {
    try {
      emit(UserCartLoading());
      Order order = await orderApiRepo.getUserOrder();
      total = order.total!;
      orderItems = order.orderItems ?? orderItems;
      emit(UserCartLoadingDone());
    } catch (e) {
      emit(UserCartLoadingFailed());
    }
  }

  deleteAllItems() {
    orderItems = [];
    emit(OrderRemoverd());
  }
}
