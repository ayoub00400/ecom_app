import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routing/route_manager.dart';
import '../../../utils/constants.dart';
import '../../common/product_card_grid.dart';
import '../../common/product_card_list.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'widgets/custom_filter_ship.dart';
import 'widgets/custom_list.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
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
              child: BlocProvider.of<HomeCubit>(context).isGrid
                  ? const Icon(Icons.list)
                  : const Icon(Icons.grid_view),
            );
          },
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.smallPadding,
                  vertical: Constants.smallPadding,
                ),
                color: Colors.amber.withOpacity(.8),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Row(
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
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400),
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
                                ),
                                controller: searchController,
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.smallPadding),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.filter_alt_outlined,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is LoadingProducts) {
                    return Container();
                  } else {
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: BlocProvider.of<HomeCubit>(context)
                            .categories
                            .length,
                        itemBuilder: (context, index) {
                          return CustomFilterShip(
                            label: BlocProvider.of<HomeCubit>(context)
                                .categories[index],
                            index: index,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is LoadingProducts || state is LoadingCategories) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is LoadingProductsError) {
                    return CustomList(
                      onRefresh: () =>
                          BlocProvider.of<HomeCubit>(context).loadProduct(),
                      text: 'Gathering data failed, please refresh the page!',
                    );
                  } else {
                    if (BlocProvider.of<HomeCubit>(context).searchResult ==
                        null) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return BlocProvider.of<HomeCubit>(context)
                            .searchResult!
                            .isEmpty
                        ? Expanded(
                            child: CustomList(
                              onRefresh: () =>
                                  BlocProvider.of<HomeCubit>(context)
                                      .searchProduct(searchController.text),
                              text: 'Seems  Empty ,  there is no data to show ',
                            ),
                          )
                        : Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                searchController.text == ''
                                    ? BlocProvider.of<HomeCubit>(context)
                                        .loadProduct()
                                    : BlocProvider.of<HomeCubit>(context)
                                        .searchProduct(
                                        searchController.text,
                                      );
                              },
                              child: BlocProvider.of<HomeCubit>(context).isGrid
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
                                              .searchResult!
                                              .length,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          productDetailes:
                                              BlocProvider.of<HomeCubit>(
                                            context,
                                          ).searchResult![index],
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      itemCount:
                                          BlocProvider.of<HomeCubit>(context)
                                              .searchResult!
                                              .length,
                                      itemBuilder: (context, index) {
                                        return ProductCardList(
                                          onTap: () =>
                                              Navigator.of(context).pushNamed(
                                            RouterManager
                                                .productDetailsScreenRoute,
                                            arguments:
                                                BlocProvider.of<HomeCubit>(
                                              context,
                                            ).searchResult![index],
                                          ),
                                          productDetailes:
                                              BlocProvider.of<HomeCubit>(
                                            context,
                                          ).searchResult![index],
                                        );
                                      },
                                    ),
                            ),
                          );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
