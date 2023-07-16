import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routing/route_manager.dart';
import 'config/theme/theme.dart';
import 'utils/prefs.dart';
import 'view/screens/login/cubit/login_cubit.dart';
import 'view/screens/login/cubit/login_state.dart';

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
      create: (context) => LoginCubit()..getLoginCredantials(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ecomme App',
            themeMode: ThemeMode.light,
            theme: lightThemeData,
            initialRoute: (BlocProvider.of<LoginCubit>(context).token != null &&
                    BlocProvider.of<LoginCubit>(context).userData != null)
                ? RouterManager.homeLayoutScreenRoute
                : RouterManager.loginScreenRoute,
            routes: RouterManager.routes,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            locale: const Locale('en'),
          );
        },
      ),
    );
  }
}
