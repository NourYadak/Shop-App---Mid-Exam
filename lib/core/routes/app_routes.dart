import 'package:shop_app/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/login/view/login_screen.dart';
import 'package:shop_app/features/forgotPass/view/forgotpass_screen.dart';
import 'package:shop_app/features/product/view/product_screen.dart';
import 'package:shop_app/features/product_details/view/product_details_screen.dart';
import 'package:shop_app/features/splash/view/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );

      case AppPages.forgotPassScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ForgotPassScreen();
          },
        );

      case AppPages.productScreen:
        return MaterialPageRoute(
          builder: (context) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final email = arguments['email'];
            final password = arguments['password'];
            return ProductScreen(email: email, password: password);
          },
        );

      case AppPages.forgotPassScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ForgotPassScreen();
          },
        );

      case AppPages.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ProductDetailsScreen(data: settings.arguments as dynamic);
          },
        );

      case AppPages.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
    }
    return null;
  }
}
