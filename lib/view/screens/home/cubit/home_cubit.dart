import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/product.dart';
import '../../../../utils/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isGrid = true;
  List<Product>? productsList;
  List<Product> resultOfSearch = [];
  HomeCubit() : super(HomeInitial());
  Future<void> loadProduct() async {
    try {
      emit(LoadingProducts());
      productsList = await productApiRepo.getAllProducts();
      resultOfSearch = productsList!;
      emit(LoadingProductsDone());
    } catch (e) {
      if (e is Exception) {
        emit(LoadingProductsError(e.toString()));
        throw Exception();
      } else {
        emit(LoadingProductsFailed());
        throw Exception();
      }
    }
  }

  void changeViewLayout() {
    isGrid = !isGrid;
    emit(HomeLayoutChanged());
  }

  void searchProduct(String searchText) {
    resultOfSearch = productsList!;
    print('208 Pegeot');
    emit(LoadingProducts());
    resultOfSearch = productsList!
        .where(
          (element) => element.title
              .toLowerCase()
              .contains(searchText.toLowerCase().trim()),
        )
        .toList();
    resultOfSearch = resultOfSearch.isEmpty ? [] : resultOfSearch;

    emit(LoadingProductsDone());
  }
}
