import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/product.dart';
import '../../../../repositories/remote/product/product_repo_imp.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isGrid = true;
  List<Product>? productsList;
  List<dynamic> categoriessList = [];
  List<Product>? resultOfSearch;
  int? selectedCatShip;

  final productApiRepo = ProductRepoImp();

  HomeCubit() : super(HomeInitial());

  Future<void> loadProduct() async {
    try {
      emit(LoadingProducts());
      selectedCatShip = null;
      productsList = await productApiRepo.getAllProducts();
      categoriessList = await productApiRepo.getAllProductsCategories();
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

      productsList = await productApiRepo.getCategoryProducts(category);
      resultOfSearch = productsList!;

      emit(LoadingProductsDone());
    } catch (e) {
      emit(LoadingCategoriesFailed());
    }
  }
}
