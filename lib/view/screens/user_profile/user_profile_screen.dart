import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routing/route_manager.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions/build_context.dart';
import '../login/cubit/login_cubit.dart';
import '../login/cubit/login_state.dart';
import 'cubit/user_profile_cubit.dart';
import 'widgets/custom_list_tile.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(Constants.mediumPadding),
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: AssetImage(AssetManager.profileImg),
                  ),
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Text(
                      '${context.watch<LoginCubit>().userData!.name.firstname} ${context.watch<LoginCubit>().userData!.name.lastname}',
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const SizedBox(
                  height: 36,
                ),
                Column(
                  children: [
                    CustomListTile(
                      onTap: () => Navigator.of(context).pushNamed(
                          RouterManager.userProfileDetailsScreenRoute),
                      title: context.loc.editeProfile,
                      prefixIcon: Icons.person_2_outlined,
                      suffixIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    CustomListTile(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RouterManager.settingsSectionScreenRoute),
                      title: context.loc.settings,
                      prefixIcon: Icons.settings_outlined,
                      suffixIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    CustomListTile(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RouterManager.langSectionScreenRoute),
                      title: context.loc.language,
                      prefixIcon: Icons.translate_outlined,
                      suffixIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    BlocConsumer<UserProfileCubit, UserProfileState>(
                      listener: (context, state) {
                        if (state is LogOut) {
                          Navigator.popAndPushNamed(
                              context, RouterManager.loginScreenRoute);
                        }
                      },
                      builder: (context, state) {
                        return CustomListTile(
                          onTap: () =>
                              context.read<UserProfileCubit>().logOut(),
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
      ),
    );
  }
}
