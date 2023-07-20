import 'package:ecom_app/config/language/cubit/lang_cubit.dart';
import 'package:ecom_app/config/language/cubit/lang_state.dart';
import 'package:ecom_app/utils/extensions/price_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product.dart';
import '../../utils/constants.dart';

class ProductCardList extends StatelessWidget {
  final Product productDetailes;
  final Function onTap;

  const ProductCardList(
      {super.key, required this.productDetailes, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 200,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.borderRadius)),
          child: Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.smallPadding),
                  width: 120,
                  child: Hero(
                    tag: productDetailes.id,
                    child: Image.network(
                      productDetailes.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(productDetailes.category),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      productDetailes.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 18,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${productDetailes.rating.rate} (${productDetailes.rating.count})',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: Constants.smallPadding),
                          child: BlocBuilder<LangCubit, LangState>(
                            builder: (context, state) {
                              return Text(
                                productDetailes.price.priceFormatter(
                                    BlocProvider.of<LangCubit>(context)
                                        .appLang),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green[700],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
