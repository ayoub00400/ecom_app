import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class CustomListTile extends StatelessWidget {
  final Color tileColor;
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.tileColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.smallPadding, vertical: Constants.smallPadding),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.borderRadius)),
        contentPadding: const EdgeInsets.symmetric(
            vertical: Constants.smallPadding,
            horizontal: Constants.mediumPadding),
        tileColor: Colors.amber.withOpacity(.2),
        title: Text(title),
        leading: Icon(prefixIcon),
        trailing: Icon(suffixIcon),
      ),
    );
  }
}
