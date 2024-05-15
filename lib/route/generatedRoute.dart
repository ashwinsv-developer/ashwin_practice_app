import 'package:ashwin_practice_app/UI/Screen/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class GenerateRoute {
  static Route<dynamic>  generateRoute ( RouteSettings settings){
    switch(settings.name){
      case "/login":
        return  MaterialPageRoute(builder:(_) =>LoginPage());
      case "/home":
        return  MaterialPageRoute(builder:(_) =>MyHomePage(title: 'Home page'));

      default:
        return  MaterialPageRoute(builder:(_) =>MyHomePage(title: 'Home page'));
    }

  }
}