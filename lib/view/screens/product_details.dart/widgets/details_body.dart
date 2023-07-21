import 'package:ecom_app/utils/extensions/price_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/language/cubit/lang_cubit.dart';
import '../../../../config/language/cubit/lang_state.dart';
import '../../../../model/product.dart';
import '../../../../utils/constants.dart';

class DetailsPart extends StatelessWidget {
  final Product productData;
  const DetailsPart({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    ValueNotifier showMore = ValueNotifier(false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.mediumPadding),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productData.category,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              BlocBuilder<LangCubit, LangState>(
                builder: (context, state) {
                  return Text(
                    productData.price.priceFormatter(
                        BlocProvider.of<LangCubit>(context).appLang),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Constants.priceColor,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            productData.title,
            maxLines: 3,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${productData.rating.rate} | (${productData.rating.count}) Reviews',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ValueListenableBuilder(
            valueListenable: showMore,
            builder: (context, value, child) {
              return showMore.value
                  ? Column(
                      children: [
                        const Text(
                          'The amber droplet hung from the branch, reaching fullness and ready to drop. It waited. While many of the other droplets were satisfied to form as big as they could and release, this droplet had other plans. It wanted to be part of history. It wanted to be remembered long after all the other droplets had dissolved into history. So it waited for the perfect specimen to fly by to trap and capture that it hoped would eventually be discovered hundreds of years in the future.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                        Center(
                          child: TextButton.icon(
                            onPressed: () {
                              showMore.value = !showMore.value;
                            },
                            icon: const Icon(Icons.remove),
                            label: const Text('Show Less'),
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        const Text(
                          'The amber droplet hung from the branch, reaching fullness and ready to drop. It waited. While many of the other droplets were satisfied to form as big as they could and release, this droplet had other plans. It wanted to be part of history. It wanted to be remembered long after all the other droplets had dissolved into history. So it waited for the perfect specimen to fly by to trap and capture that it hoped would eventually be discovered hundreds of years in the future..',
                          maxLines: 6,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            height: 1.4,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Center(
                          child: TextButton.icon(
                            onPressed: () {
                              showMore.value = !showMore.value;
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Show More'),
                          ),
                        )
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
