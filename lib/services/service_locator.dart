import 'package:get_it/get_it.dart';
import 'package:postino/business_login/view_models/auth_screen_view_model.dart';
import 'package:postino/business_login/view_models/chat_screen_view_model.dart';
import 'package:postino/business_login/view_models/dashboard_view_model.dart';
import 'package:postino/business_login/view_models/home_screen_view_model.dart';
import 'package:postino/business_login/view_models/onboarding_screen_view_model.dart';
import 'package:postino/business_login/view_models/splash_screen_view_model.dart';
import 'package:postino/services/Firebase/service_impl.dart';
import 'package:postino/services/Navigation/service_impl.dart';
import 'package:postino/services/device/service_impl.dart';
import 'package:postino/services/e2e/service_impl.dart';
import 'package:postino/services/local_database/service_impl.dart';
import 'package:postino/services/size_config/service_impl.dart';

GetIt serviceLocator = GetIt.instance;
final navigationService = serviceLocator<NavigationServiceImpl>();
final sizeConfig = serviceLocator<SizeConfigServiceImpl>();
final firebaseService = serviceLocator<FirebaseServiceImpl>();
final deviceService = serviceLocator<DeviceServiceImpl>();
final localDatabaseService = serviceLocator<LocalDatabaseServiceImpl>();
final e2eeService = serviceLocator<E2EEServiceImpl>();

void setupServiceLocator() {
  serviceLocator.registerSingleton(SizeConfigServiceImpl());
  serviceLocator.registerSingleton(NavigationServiceImpl());
  serviceLocator.registerSingleton(FirebaseServiceImpl());
  serviceLocator.registerSingleton(DeviceServiceImpl());
  serviceLocator.registerSingleton(LocalDatabaseServiceImpl());
  serviceLocator.registerSingleton(E2EEServiceImpl());

  serviceLocator.registerFactory(() => SplashScreenViewModel());
  serviceLocator.registerFactory(() => OnboardingScreenViewModel());
  serviceLocator.registerFactory(() => AuthScreenViewModel());
  serviceLocator.registerFactory(() => DashboardViewModel());
  serviceLocator.registerFactory(() => HomeScreenViewModel());
  serviceLocator.registerFactory(() => ChatScreenViewModel());
}
