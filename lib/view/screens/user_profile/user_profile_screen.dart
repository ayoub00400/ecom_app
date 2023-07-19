import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routing/route_manager.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions.dart';
import '../login/cubit/login_cubit.dart';
import '../login/cubit/login_state.dart';
import 'widgets/custom_list_tile.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.mediumePadding),
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: AssetImage(AssetManager.profileImg),
                ),
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Text(
                    '${context.watch<LoginCubit>().userData!.name.firstname} ${context.watch<LoginCubit>().userData!.name.lastname}',
                    style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(
                height: 36,
              ),
              Column(
                children: [
                  CustomListTile(
                    onTap: () => Navigator.of(context).pushNamed(RouterManager.userProfileDetailsScreenRoute),
                    title: context.loc.editeProfile,
                    prefixIcon: Icons.person,
                    suffixIcon: Icons.arrow_forward_ios_rounded,
                  ),
                  CustomListTile(
                    onTap: () => Navigator.of(context).pushNamed(RouterManager.settingsSectionScreenRoute),
                    title: context.loc.settings,
                    prefixIcon: Icons.settings,
                    suffixIcon: Icons.arrow_forward_ios_rounded,
                  ),
                  CustomListTile(
                    onTap: () => Navigator.of(context).pushNamed(RouterManager.langSectionScreenRoute),
                    title: context.loc.language,
                    prefixIcon: Icons.translate,
                    suffixIcon: Icons.arrow_forward_ios_rounded,
                  ),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LogOut) {
                        Navigator.popAndPushNamed(context, RouterManager.loginScreenRoute);
                      }
                    },
                    builder: (context, state) {
                      return CustomListTile(
                        onTap: () => context.read<LoginCubit>().logOut(),
                        title: context.loc.logout,
                        prefixIcon: Icons.logout_rounded,
                        suffixIcon: Icons.arrow_forward_ios_rounded,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
