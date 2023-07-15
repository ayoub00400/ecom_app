import 'package:flutter/material.dart';

import '../../../model/product.dart';
import '../../common/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier showMore = ValueNotifier(false);
    Product productData = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(24, 64, 195, 255),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 250,
                        color: Colors.white,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Hero(
                              tag: productData.id,
                              child: Image.network(
                                productData.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                Text(
                                  '\$${productData.price}',
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22,
                                    color: Colors.green[800],
                                  ),
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
                                  color: Colors.orange,
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
                                                showMore.value =
                                                    !showMore.value;
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
                                                showMore.value =
                                                    !showMore.value;
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
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        buttonLabel: 'ADD TO CART',
                        buttColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        buttonLabel: 'BUY NOW',
                        buttColor: Colors.black,
                        labelColor: Colors.white,
                      ),
                    )
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
