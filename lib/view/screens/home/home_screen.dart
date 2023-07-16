import 'cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/product_card_grid.dart';
import '../../common/product_card_list.dart';
import 'widgets/custom_refreshable_list.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchFieldController = TextEditingController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadProduct(),
      child: Scaffold(
        floatingActionButton: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return FloatingActionButton.small(
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).changeViewLayout();
              },
              child: const Icon(Icons.layers_outlined),
            );
          },
        ),
        body: SafeArea(
<<<<<<< HEAD
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is LoadingProducts) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadingProductsDone || state is HomeLayoutChanged) {
                return Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          color: Colors.amber.withOpacity(.8),
                          height: 60,
                          width: double.maxFinite,
                          child: const Row(children: [
                            SizedBox(
                                width: 320,
                                child: SearchBar(
                                  leading: Icon(Icons.search),
                                ),),
                            Spacer(),
                            Icon(Icons.settings)
                          ],),
                        ),
                        Expanded(
                          child: Container(
                            child: RefreshIndicator(
                              onRefresh: () => BlocProvider.of<HomeCubit>(context).loadProduct(),
                              child: BlocProvider.of<HomeCubit>(context).isGrid
                                  ? GridView.builder(
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .75,
                                        mainAxisSpacing: 1,
                                        crossAxisSpacing: 0,
                                      ),
                                      itemCount: BlocProvider.of<HomeCubit>(context).productsList!.length,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          productDetailes: BlocProvider.of<HomeCubit>(context).productsList![index],
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      itemCount: BlocProvider.of<HomeCubit>(context).productsList!.length,
                                      itemBuilder: (context, index) {
                                        return ProductCardList(
                                          productDetailes: BlocProvider.of<HomeCubit>(context).productsList![index],
                                        );
                                      },
                                    ),
=======
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                color: Colors.amber.withOpacity(.8),
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    SizedBox(
                      width: 320,
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return TextField(
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              if (value == '') {
                                BlocProvider.of<HomeCubit>(context)
                                    .loadProduct();
                              } else {
                                BlocProvider.of<HomeCubit>(context)
                                    .searchProduct(value);
                              }
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Search for item',
                              prefixIcon: const Icon(Icons.search),
>>>>>>> a54fa2ce59a8b1e3bdddce7474b32efb35c3e30f
                            ),
                            controller: searchFieldController,
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          print('Filtring');
                        },
                        child: const Icon(Icons.settings),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is LoadingProducts) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is LoadingProductsDone ||
                        state is HomeLayoutChanged) {
                      return BlocProvider.of<HomeCubit>(context)
                              .resultOfSearch
                              .isEmpty
                          ? Expanded(
                              child: CustomRereshableBodyList(
                                onRefresh: () => BlocProvider.of<HomeCubit>(
                                        context)
                                    .searchProduct(searchFieldController.text),
                                text:
                                    'Seems  Empty ,  there is no data to show ',
                              ),
                            )
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  searchFieldController.text == ''
                                      ? BlocProvider.of<HomeCubit>(context)
                                          .loadProduct()
                                      : BlocProvider.of<HomeCubit>(context)
                                          .searchProduct(
                                          searchFieldController.text,
                                        );
                                },
                                child: BlocProvider.of<HomeCubit>(context)
                                        .isGrid
                                    ? GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: .75,
                                          mainAxisSpacing: 1,
                                          crossAxisSpacing: 0,
                                        ),
                                        itemCount:
                                            BlocProvider.of<HomeCubit>(context)
                                                .resultOfSearch
                                                .length,
                                        itemBuilder: (context, index) {
                                          return ProductCard(
                                            productDetailes:
                                                BlocProvider.of<HomeCubit>(
                                              context,
                                            ).resultOfSearch[index],
                                          );
                                        },
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            BlocProvider.of<HomeCubit>(context)
                                                .resultOfSearch
                                                .length,
                                        itemBuilder: (context, index) {
                                          return ProductCardList(
                                            productDetailes:
                                                BlocProvider.of<HomeCubit>(
                                              context,
                                            ).resultOfSearch[index],
                                          );
                                        },
                                      ),
                              ),
                            );
                    }
                    if (state is LoadingProductsFailed ||
                        state is LoadingProductsError) {
                      return CustomRereshableBodyList(
                        onRefresh: () =>
                            BlocProvider.of<HomeCubit>(context).loadProduct(),
                        text: 'Gathering data failed, please refresh the page!',
                      );
                    }

                    return const Center(
                        child: Text('Oppps try to relunch the app'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
