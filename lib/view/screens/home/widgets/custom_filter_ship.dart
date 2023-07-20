import '../cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';

class CustomFilterShip extends StatelessWidget {
  final int index;
  final String label;
  const CustomFilterShip({super.key, required this.label, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.smallPadding),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<HomeCubit>(context).selectedCategory(index, label);
        },
        child: Chip(
          backgroundColor:
              index == BlocProvider.of<HomeCubit>(context).selectedCat
                  ? Colors.amber
                  : null,
          label: Text(label),
        ),
      ),
    );
  }
}
