import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/product.dart';
import '../../../../utils/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isGrid = true;
  List<Product>? productsList;
  List<dynamic> categoriessList = [];
  List<Product>? resultOfSearch;
  int? selectedCatShip;

  // repos
  // final productApiRepo = ProductRepoImp();

  HomeCubit() : super(HomeInitial());

  Future<void> loadProduct() async {
    try {
      emit(LoadingProducts());
      selectedCatShip = null;
      productsList = await Constants.productApiRepo.getAllProducts();
      categoriessList = await Constants.productApiRepo.getAllProductsCategories();
      resultOfSearch = productsList!;
      emit(LoadingProductsDone());
    } catch (e) {
      emit(LoadingProductsError(e.toString()));
    }
  }

  void changeViewLayout() {
    isGrid = !isGrid;
    emit(HomeLayoutChanged());
  }

  void searchProduct(String searchText) {
    resultOfSearch = productsList!;

    emit(LoadingProducts());
    resultOfSearch = productsList!
        .where(
          (element) => element.title.toLowerCase().contains(searchText.toLowerCase().trim()),
        )
        .toList();
    resultOfSearch = resultOfSearch!.isEmpty ? [] : resultOfSearch;

    emit(LoadingProductsDone());
  }

  void selectedCategory(int index, String category) async {
    try {
      emit(LoadingProducts());
      selectedCatShip = index;

      productsList = await Constants.productApiRepo.getCategoryProducts(category);
      resultOfSearch = productsList!;

      emit(LoadingProductsDone());
    } catch (e) {
      emit(LoadingCategoriesFailed());
    }
  }
}
