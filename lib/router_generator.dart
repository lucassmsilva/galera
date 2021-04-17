import 'package:flutter/material.dart';
import 'package:galera/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/loginpage':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/mycandidates':
        return MaterialPageRoute(builder: (_) => MyCandidates());
      case '/signature':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MySignature(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/enterview':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyEnterview(
              data: args,
            ),
          );
        }
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
