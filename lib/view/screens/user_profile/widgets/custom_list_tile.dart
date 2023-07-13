import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Color tileColor;
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  CustomListTile(
      {super.key,
      required this.title,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.tileColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        tileColor: Colors.amber.withOpacity(.2),
        title: Text(title),
        leading: Icon(prefixIcon),
        trailing: Icon(suffixIcon),
      ),
    );
  }
}
