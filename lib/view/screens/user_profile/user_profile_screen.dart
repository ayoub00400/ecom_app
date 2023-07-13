import 'package:flutter/material.dart';

import '../../../config/routing/route_manager.dart';
import '../../../utils/constants.dart';
import 'widgets/custom_list_tile.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.maxFinite,
        child: Column(children: [
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
          const Text(
            'Marting Williams',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            child: Column(children: [
              CustomListTile(
                onTap: () => Navigator.of(context).pushNamed(RouterManager.userProfileDetailsScreenRoute),
                title: 'Edite Profile',
                prefixIcon: Icons.person,
                suffixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomListTile(
                title: 'Settings',
                prefixIcon: Icons.settings,
                suffixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomListTile(
                title: 'Language',
                prefixIcon: Icons.translate,
                suffixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomListTile(
                title: 'Logout',
                prefixIcon: Icons.logout_rounded,
                suffixIcon: Icons.arrow_forward_ios_rounded,
              ),
            ],),
          )
        ],),
      ),),
    );
  }
}
