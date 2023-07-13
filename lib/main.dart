import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routing/route_manager.dart';
import 'config/theme/theme.dart';
import 'utils/prefs.dart';
import 'view/screens/login/cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..checkLoginStatus(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ecomme App',
            themeMode: ThemeMode.light,
            theme: lightThemeData,
            initialRoute: BlocProvider.of<LoginCubit>(context).token != null
                ? RouterManager.homeLayoutScreenRoute
                : RouterManager.loginScreenRoute,
            routes: RouterManager.routes,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            // locale: Locale('en'),
          );
        },
      ),
    );
  }
}