import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routing/route_manager.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions.dart';
import '../../common/custom_button.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';
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
          if (state is LoginDone) {
            Navigator.of(context).popAndPushNamed(RouterManager.homeLayoutScreenRoute);
          }
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Constants.smallPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AssetManager.loginImg),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Constants.smallPadding),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      context.loc.loginHeader,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: usernameFieldController,
                          label: context.loc.username,
                          prefixIcon: Icons.email,
                        ),
                        CustomTextField(
                          controller: passwordFieldController,
                          label: context.loc.password,
                          prefixIcon: Icons.password,
                          suffixIcon: Icons.hide_source_rounded,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomButton(
                        buttColor: Colors.amber,
                        buttonLabel: context.loc.loginButton,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              usernameFieldController.text,
                              passwordFieldController.text,
                            );
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
                          context.loc.ifNotUser,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            context.loc.register,
                            style: const TextStyle(fontSize: 18, color: Colors.amber),
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
