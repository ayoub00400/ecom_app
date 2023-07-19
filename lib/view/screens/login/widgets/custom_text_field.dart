import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function? onTap;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.mediumPadding, vertical: Constants.mediumPadding),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (fieldContent) {
          if (fieldContent == null) {
            return 'Field Empty!';
          } else {
            return null;
          }
        },
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          label: Text(label),
          suffixIcon: GestureDetector(onTap: () => onTap, child: Icon(suffixIcon)),
        ),
      ),
    );
  }
}
