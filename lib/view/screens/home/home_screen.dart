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
                return BlocProvider.of<HomeCubit>(context).isGrid
                    ? GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .75,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: BlocProvider.of<HomeCubit>(context).productsList!.length,
                        itemBuilder: (context, index) {
                          return ProductCard(productDetailes: BlocProvider.of<HomeCubit>(context).productsList![index]);
                        },
                      )
                    : ListView.builder(
                        itemCount: BlocProvider.of<HomeCubit>(context).productsList!.length,
                        itemBuilder: (context, index) {
                          return ProductCardList(
                            productDetailes: BlocProvider.of<HomeCubit>(context).productsList![index],
                          );
                        },
                      );
              }
              if (state is LoadingProductsFailed || state is LoadingProductsError) {
                return const Center(
                  child: Text('Gathering data failed, please refresh the page!'),
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
