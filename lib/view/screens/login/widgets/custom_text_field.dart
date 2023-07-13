import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (fieldContent) {
          //TODO:fix bug here:
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