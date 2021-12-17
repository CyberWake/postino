import 'package:postino/business_login/utils/routing_constants.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';
import 'package:postino/services/service_locator.dart';

class SplashScreenViewModel extends BaseModel {
  init() async {
    final bool isLoggedIn = firebaseService.getLoggedInUser();
    final bool isAuthorisedOnce =
        await localDatabaseService.getIsAuthorisesOnce() as bool;
    Future.delayed(
      const Duration(seconds: 3),
      () => navigationService.pushReplacementScreen(
        isLoggedIn
            ? Routes.dashboard
            : isAuthorisedOnce
                ? Routes.auth
                : Routes.onBoarding,
      ),
    );
  }
}
