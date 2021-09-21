import 'package:flutter/material.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';

class OnboardingScreenViewModel extends BaseModel {
  PageController controller = PageController(
    initialPage: 0,
  );

  final List<String> title = [
    'Hey,\nWelcome',
    'Flawless\nservice',
    'User\nfriendly'
  ];
  final List<String> subTitle = [
    'Here in Postino message privacy does matter most.',
    'We work hard to provide flawless service to our users possible',
    'Moreover, our main concern is to make the app user friendly comparing others on the market'
  ];

  double opacity = 1.0;
  int page = 0;

  void scrollListener() {
    opacity = controller.page! % 1 == 0
        ? 1.0
        : (controller.page! - controller.page!.floor()) / 10;
    page = controller.page!.floor();
    notifyListeners();
  }

  void next() {
    if (page != 2) {
      controller.animateToPage(
        page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }

  init() {
    controller.addListener(scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
