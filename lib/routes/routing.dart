import 'package:flutter/material.dart';
import 'package:medinas_app/pages/AddProduct/addProduct.dart';
import 'package:medinas_app/pages/Home/home.screen.dart';
import 'package:medinas_app/pages/Login/create.screen.dart';
import 'package:medinas_app/pages/Login/login.screen.dart';
import 'package:medinas_app/pages/Login/select.screen.dart';
import 'package:medinas_app/pages/Splash/splash.screen.dart';

class RouteManager {
  static const String selectScreen = '/settings';
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String createScreen = '/create';
  static const String homeScreen = '/home';
  static const String addProductScreen = '/add';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case createScreen:
        return MaterialPageRoute(builder: (context) => CreateScreen());

      case selectScreen:
        return MaterialPageRoute(builder: (context) => SelectScreen());

      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case addProductScreen:
        return MaterialPageRoute(builder: (context) => AddProductScreen());

      default:
        throw FormatException("Route not found");
    }
  }
}
