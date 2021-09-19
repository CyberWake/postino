import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postino/business_login/utils/routing_constants.dart';
import 'package:postino/main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(
        builder: (context) => const MyHomePage(
          key: Key('Error'),
          title: 'HomePage',
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const MyHomePage(
          key: Key('Error'),
          title: 'Error',
        ),
      );
  }
}
