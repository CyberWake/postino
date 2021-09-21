import 'package:flutter/material.dart';
import 'package:postino/business_login/view_models/splash_screen_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/views/base_view.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return BaseView<SplashScreenViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color(0xFF1A3764),
          body: Center(
            child: Image.asset(
              'assets/images/splash_flutter.png',
              fit: BoxFit.contain,
              height: 175,
              width: 175,
            ),
          ),
        );
      },
    );
  }
}
