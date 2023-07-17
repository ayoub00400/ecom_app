import 'package:ecom_app/utils/extensions.dart';
import 'package:ecom_app/view/common/custom_button.dart';
import 'package:ecom_app/view/screens/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';

import '../../login/cubit/login_state.dart';
import '../../login/widgets/custom_text_field.dart';
import 'cubit/user_details_cubit.dart';

class UserProfileDetailsScreen extends StatelessWidget {
  const UserProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsCubit()..initUserData(context.read<LoginCubit>().userData!),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: AssetImage(AssetManager.profileImg),
                      ),
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Text(
                          '${context.watch<LoginCubit>().userData!.name.firstname} ${context.watch<LoginCubit>().userData!.name.lastname}',
                          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    CustomTextField(
                        controller: context.read<UserDetailsCubit>().emailController,
                        label: context.loc.email,
                        prefixIcon: Icons.email),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: context.read<UserDetailsCubit>().usernameController,
                        label: context.loc.username,
                        prefixIcon: Icons.person),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: context.read<UserDetailsCubit>().fullNameController,
                        label: context.loc.fullName,
                        prefixIcon: Icons.person),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: context.read<UserDetailsCubit>().addressController,
                        label: context.loc.address,
                        prefixIcon: Icons.location_city),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: context.read<UserDetailsCubit>().zipCodeController,
                        label: context.loc.zipCode,
                        prefixIcon: Icons.pin),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: context.read<UserDetailsCubit>().phoneController,
                        label: context.loc.phoneNumber,
                        prefixIcon: Icons.phone),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      width: 300,
                      buttonLabel: context.loc.save,
                      onPressed: () {
                        context.read<UserDetailsCubit>().saveDetails();
                      },
                      height: 40,
                      buttColor: Colors.amber,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}