import 'package:postino/business_login/utils/routing_constants.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';
import 'package:postino/services/service_locator.dart';

class SplashScreenViewModel extends BaseModel {
  init() {
    Future.delayed(
      const Duration(seconds: 3),
      () => navigationService.pushReplacementScreen(Routes.onboarding),
    );
  }
}
