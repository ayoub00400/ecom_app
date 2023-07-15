import 'package:ecom_app/view/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../login/widgets/custom_text_field.dart';

class UserProfileDetailsScreen extends StatelessWidget {
  const UserProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              const Text(
                'Marting Williams',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 36,
              ),
              const CustomTextField(label: 'Email', prefixIcon: Icons.email),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                  label: 'Username', prefixIcon: Icons.person),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                  label: 'Address', prefixIcon: Icons.location_city),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(label: 'Zip Code', prefixIcon: Icons.pin),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                  label: 'Phone Number', prefixIcon: Icons.phone),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                width: 300,
                buttonLabel: 'Save',
                onPressed: () {},
                height: 40,
                buttColor: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
