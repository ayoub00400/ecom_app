import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/order.dart';
import '../../../../model/order_item.dart';
import '../../../../utils/constants.dart';

part 'user_order_state.dart';

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

  void deleteAllItems() {
    orderItems = [];
    emit(OrderRemoverd());
  }

  void deleteSingleItem(int id) {
    orderItems.removeWhere((element) => element.id == id);
    emit(SingleItemRemoved());
  }
}
