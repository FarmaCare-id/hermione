import 'package:farmacare/ui/home/home.dart';
import 'package:farmacare/ui/login/login.dart';
import 'package:farmacare/ui/splash/splash.dart';
import 'package:flutter/material.dart';

import 'package:farmacare/ui/home/post.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String post = '/post';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    post: (BuildContext context) => PostScreen(),
  };
}



