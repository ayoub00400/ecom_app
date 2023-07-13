import 'cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/product_card_grid.dart';
import '../../common/product_card_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                          child: Row(children: [
                            SizedBox(
                                width: 320,
                                child: SearchBar(
                                  leading: Icon(Icons.search),
                                )),
                            Spacer(),
                            Icon(Icons.settings)
                          ]),
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is LoadingProductsFailed || state is LoadingProductsError) {
                return RefreshIndicator(
                  onRefresh: () => BlocProvider.of<HomeCubit>(context).loadProduct(),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      const Center(child: Text('Gathering data failed, please refresh the page!'))
                    ],
                  ),
                );
              }

              return Container(child: null);
            },
          ),
        ),
      ),
    );
  }
}
