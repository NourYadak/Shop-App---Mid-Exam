import 'package:shop_app/core/routes/app_pages.dart';
import 'package:shop_app/core/routes/app_routes.dart';
import 'package:shop_app/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: 'My App',
      initialRoute: AppPages.splashScreen,
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      themeMode: ThemeMode.system,
      // home: LoginScreen(),
    );
  }
}

