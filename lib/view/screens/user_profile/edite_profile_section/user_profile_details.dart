import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../common/custom_button.dart';
import '../../login/widgets/custom_text_field.dart';

class UserProfileDetailsScreen extends StatelessWidget {
  const UserProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: AssetImage(AssetManager.profileImg),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Marting Williams',
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      CustomButton(
                        onPressed: () {},
                        labelColor: Colors.white,
                        height: 40,
                        width: 80,
                        buttonLabel: 'Edit profile',
                        buttColor: Colors.amber,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  CustomTextField(label: 'Email', prefixIcon: Icons.email),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(label: 'Username', prefixIcon: Icons.person),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(label: 'Address', prefixIcon: Icons.location_city),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(label: 'Zip Code', prefixIcon: Icons.pin),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(label: 'Phone Number', prefixIcon: Icons.phone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
