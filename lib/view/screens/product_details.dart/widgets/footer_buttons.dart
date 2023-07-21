import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../common/custom_button.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: Constants.smallPadding,
          left: Constants.mediumPadding,
          right: Constants.mediumPadding),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              isLoading: false,
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Add to cart')));
              },
              buttonLabel: 'ADD TO CART',
              buttColor: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: CustomButton(
              isLoading: false,
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Buy Now')));
              },
              buttonLabel: 'BUY NOW',
              buttColor: Colors.black,
              labelColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
