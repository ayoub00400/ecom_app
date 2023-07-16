abstract class UserCartState {}

class UserCartInitial extends UserCartState {}

class UserCartLoading extends UserCartState {}

class UserCartLoadingDone extends UserCartState {}

class UserCartLoadingFailed extends UserCartState {}

class OrderRemoverd extends UserCartState {}

class SingleItemRemoved extends UserCartState {}
