abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingProducts extends HomeState {}

class LoadingProductsDone extends HomeState {}

class LoadingProductsFailed extends HomeState {}

class LoadingProductsError extends HomeState {
  final String erroString;
  LoadingProductsError(this.erroString);
}

class LoadingCategories extends HomeState {}

class LoadingCategoriesDone extends HomeState {}

class LoadingCategoriesFailed extends HomeState {}

class UserAlreadyLoggedIn extends HomeState {}

class UserNotLoggedInYet extends HomeState {}

class HomeLayoutChanged extends HomeState {}

class ShipSelected extends HomeState {}
