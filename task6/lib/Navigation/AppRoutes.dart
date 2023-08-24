import 'package:flutter/material.dart';
import 'package:task6/Presentation/Screen/home_page_screen.dart';
import 'package:task6/Presentation/Screen/SignIn.dart';
import 'package:task6/Presentation/Screen/SignUp.dart';
import 'package:task6/Presentation/Screen/LoadingScreen.dart';


class AppRoutes {
  static const String loading = '/';
  static const String home = '/home';
  static const String productsPage = '/SignIn';
  static const String cartPage = '/SignUp';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRoutes.productsPage:
      return MaterialPageRoute(builder: (_) => SignIn());
    case AppRoutes.cartPage:
      return MaterialPageRoute(builder: (_) => SignUp());
    default:
      return MaterialPageRoute(builder: (_) => LoadingScreen());
  }
}
