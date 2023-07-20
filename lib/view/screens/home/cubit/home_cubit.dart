import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/product.dart';
import '../../../../repositories/remote/product/product_repo_imp.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isGrid = true;
  List<Product>? products;
  List<dynamic> categories = [];
  List<Product>? searchResult;
  int? selectedCat;

  final productApiRepo = ProductRepoImp();

  HomeCubit() : super(HomeInitial());

  Future<void> loadProduct() async {
    try {
      emit(LoadingProducts());
      selectedCat = null;
      products = await productApiRepo.getAllProducts();
      categories = await productApiRepo.getAllCategories();
      searchResult = products!;
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
    searchResult = products!;

    emit(LoadingProducts());
    searchResult = products!
        .where(
          (element) => element.title
              .toLowerCase()
              .contains(searchText.toLowerCase().trim()),
        )
        .toList();
    searchResult = searchResult!.isEmpty ? [] : searchResult;

    emit(LoadingProductsDone());
  }

  void selectedCategory(int index, String category) async {
    try {
      emit(LoadingCategories());
      selectedCat = index;

      products = await productApiRepo.getProductsByCategory(category);
      searchResult = products!;

      emit(LoadingProductsDone());
    } catch (e) {
      emit(LoadingCategoriesFailed());
    }
  }
}
