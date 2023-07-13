import 'package:flutter/material.dart';

import '../../config/routing/route_manager.dart';
import '../../model/product.dart';

class ProductCard extends StatelessWidget {
  final Product productDetailes;
  const ProductCard({super.key, required this.productDetailes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouterManager.productDetailsScreenRoute, arguments: productDetailes);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        height: 310,
        width: 250,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Flexible(
                child: SizedBox(
                  height: 300,
                  child: Image.network(
                    productDetailes.image,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return child;
                      }
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.5)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(alignment: AlignmentDirectional.centerStart, child: Text(productDetailes.category)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      productDetailes.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${productDetailes.rating.rate} (${productDetailes.rating.count})',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Spacer(),
                          FittedBox(
                            child: Text(
                              '\$${productDetailes.price}',
                              style: TextStyle(fontSize: 16, color: Colors.green[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //TextButton(onPressed: () {}, child: const Text('+ Add to card'))
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