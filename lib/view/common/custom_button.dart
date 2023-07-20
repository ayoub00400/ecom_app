import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/login/cubit/login_cubit.dart';
import '../screens/login/cubit/login_state.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttColor;
  final Color labelColor;
  final String buttonLabel;
  final double width;
  final double height;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.buttonLabel,
    this.onPressed,
    required this.buttColor,
    this.labelColor = Colors.black,
    this.width = 150,
    this.height = 50,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: MaterialButton(
        height: height,
        minWidth: width,
        onPressed: onPressed,
        color: buttColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // remove bloc builder
        child: Builder(
          builder: (ctx) => isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  buttonLabel,
                  style: TextStyle(color: labelColor),
                ),
        ),
      ),
    );
  }
}
