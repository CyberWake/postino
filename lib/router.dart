import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postino/business_login/models/user_model.dart';
import 'package:postino/business_login/utils/routing_constants.dart';
import 'package:postino/main.dart';
import 'package:postino/ui/views/auth_screen_view.dart';
import 'package:postino/ui/views/chat_screen_view.dart';
import 'package:postino/ui/views/dashboard_view.dart';
import 'package:postino/ui/views/onboarding_screen_view.dart';
import 'package:postino/ui/views/splash_screen_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(
        builder: (context) => const SplashScreenView(
          key: Key('SplashScreen'),
        ),
      );
    case Routes.onBoarding:
      return MaterialPageRoute(
        builder: (context) => const OnboardingScreenView(
          key: Key('OnboardingScreen'),
        ),
      );
    case Routes.auth:
      return MaterialPageRoute(
        builder: (context) => const AuthScreenView(
          key: Key('AuthScreenView'),
        ),
      );
    case Routes.dashboard:
      return MaterialPageRoute(
        builder: (context) => const DashboardView(
          key: Key('Dashboard'),
        ),
      );
    case Routes.chat:
      final UserModel chatWithUser = settings.arguments! as UserModel;
      return MaterialPageRoute(
        builder: (context) => ChatScreenView(
          key: const Key('ChatView'),
          chatUser: chatWithUser,
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
