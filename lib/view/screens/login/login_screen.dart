import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routing/route_manager.dart';
import '../../../utils/constants.dart';
import '../../common/custom_button.dart';
import 'cubit/login_cubit.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameFieldController = TextEditingController(text: 'johnd');
  final TextEditingController passwordFieldController = TextEditingController(text: 'm38rmF\$');
  final formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          print(state);
          if (state is LoginDone) {
            Navigator.of(context).popAndPushNamed(RouterManager.homeScreenRoute);
          }
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AssetManager.loginImg),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Container(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: usernameFieldController, label: 'Username:', prefixIcon: Icons.email),
                          CustomTextField(
                            controller: passwordFieldController,
                            label: 'Password:',
                            prefixIcon: Icons.password,
                            suffixIcon: Icons.hide_source_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomButton(
                        buttColor: Colors.blue,
                        buttonLabel: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context)
                                .login(usernameFieldController.text, passwordFieldController.text);
                          }
                        },
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'if you are new here  ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Register.',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
