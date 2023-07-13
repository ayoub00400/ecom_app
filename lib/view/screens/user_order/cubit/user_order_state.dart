part of 'user_order_cubit.dart';

@immutable
abstract class UserCartState {}

class UserCartInitial extends UserCartState {}

class UserCartLoading extends UserCartState {}

class UserCartLoadingDone extends UserCartState {}

class UserCartLoadingFailed extends UserCartState {}

class OrderRemoverd extends UserCartState {}
