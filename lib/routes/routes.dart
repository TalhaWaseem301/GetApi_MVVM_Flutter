import 'package:flutter/material.dart';
import 'package:getx_mvvm/routes/routes_name.dart';
import 'package:getx_mvvm/view/home_screen.dart';
import 'package:getx_mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          ),
        );
    }
  }
}