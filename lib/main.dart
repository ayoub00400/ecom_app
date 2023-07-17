import 'package:ecom_app/config/language/cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routing/route_manager.dart';
import 'config/theme/theme.dart';
import 'utils/prefs.dart';
import 'view/screens/login/cubit/login_cubit.dart';
import 'view/screens/login/cubit/login_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit()..getLoginCredantials(),
        ),
        BlocProvider(
          create: (context) => LangCubit()..initLanguage(),
        ),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return BlocBuilder<LoginCubit, LoginState>(
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
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale(BlocProvider.of<LangCubit>(context).appLocal),
              );
            },
          );
        },
      ),
    );
  }
}
