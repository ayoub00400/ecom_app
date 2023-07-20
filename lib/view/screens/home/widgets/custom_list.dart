import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final String text;
  final Function() onRefresh;
  const CustomList({
    super.key,
    required this.text,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh;
      },
      child: ListView(
        children: [
          const SizedBox(
            height: 400,
          ),
          Center(
            child: Text(
              text,
            ),
          )
        ],
      ),
    );
  }
}
