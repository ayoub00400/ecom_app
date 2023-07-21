import 'package:ecom_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../model/product.dart';
import '../../common/custom_button.dart';
import 'widgets/footer_buttons.dart';
import 'widgets/header_icons_bar.dart';
import 'widgets/details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Container(
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
                          const IconsBar(),
                        ],
                      ),
                    ),
                    DetailsPart(
                      productData: productData,
                    )
                  ],
                ),
              ),
              const FooterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
