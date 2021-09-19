import 'package:get_it/get_it.dart';
import 'package:postino/services/Navigation/navigation_service_implementation.dart';
import 'package:postino/services/SizeConfig/size_config_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;
final navigationService = serviceLocator<NavigationServiceImpl>();
final sizeConfig = serviceLocator<SizeConfigImpl>();

void setupServiceLocator() {
  serviceLocator.registerSingleton(SizeConfigImpl());
  serviceLocator.registerSingleton(NavigationServiceImpl());

  // serviceLocator.registerFactory(() => SplashScreenViewModel());
}
