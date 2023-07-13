import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/product.dart';
import '../../../../utils/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isGrid = true;
  List<Product>? productsList;
  HomeCubit() : super(HomeInitial());
  loadProduct() async {
    try {
      emit(LoadingProducts());
      productsList = await productApiRepo.getAllProducts();

      emit(LoadingProductsDone());
    } catch (e) {
      if (e is Exception) {
        emit(LoadingProductsError(e.toString()));
      } else {
        emit(LoadingProductsFailed());
      }
    }
  }

  changeViewLayout() {
    isGrid = !isGrid;
    print(isGrid);
    emit(HomeLayoutChanged());
  }
}
