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
      print(productsList);
      emit(LoadingProducts());
      productsList = await ProductApiRepo.getAllProducts();
      print(productsList);
      emit(LoadingProductsDone());
    } catch (e) {
      if (e is Exception) {
        print(e);
        emit(LoadingProductsError(e.toString()));
      } else {
        print('failed');
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
