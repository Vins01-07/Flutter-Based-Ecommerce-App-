import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/providers/user_provider.dart';

import 'package:shop_app/providers/settings_provider.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ShopVibe',
          theme: AppTheme.lightTheme(context),
          darkTheme: AppTheme.darkTheme(context),
          themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: SplashScreen.routeName,
          routes: routes,
        );
      },
    );
  }
}
