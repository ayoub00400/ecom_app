import '../cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';

class CustomFilterShip extends StatelessWidget {
  final int shipIndex;
  final String label;
  const CustomFilterShip({super.key, required this.label, required this.shipIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.smallPadding),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<HomeCubit>(context).selectedCategory(shipIndex, label);
        },
        child: Chip(
          backgroundColor: shipIndex == BlocProvider.of<HomeCubit>(context).selectedCatShip ? Colors.amber : null,
          label: Text(label),
        ),
      ),
    );
  }
}
