import 'package:ecom_app/utils/constants.dart';
import 'package:flutter/material.dart';

class IconsBar extends StatelessWidget {
  const IconsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.mediumPadding,
        horizontal: Constants.mediumPadding,
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: IconButton(
              iconSize: 20,
              alignment: AlignmentDirectional.center,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 44,
            width: 44,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: IconButton(
              iconSize: 20,
              alignment: AlignmentDirectional.center,
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
