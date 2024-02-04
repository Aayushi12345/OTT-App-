// import 'package:ttnflix/di/service_locator.dart';
// import 'package:ttnflix/di/service_locator_impl.dart';
// import 'package:ttnflix/network/api_client.dart';
// import 'package:ttnflix/network/api_service.dart';

// import 'package:ott_app/data/network/dio_api_client.dart';
import 'package:ott_app/data/network/api_client.dart';
import 'package:ott_app/data/repositories%20/api/api_service.dart';
import 'package:ott_app/di/service_locator.dart';
import 'package:ott_app/di/service_locator_impl.dart';

import '../preference/shared_preferences.dart';

class AppModule {
  Future<void> initialise() async {
    // Initialise service provider
    ServiceLocatorImpl().initialise();
    final serviceLocator = ServiceLocator.ttnServiceLocator;
    // Api Service
    if (!serviceLocator.isRegistered<ApiService>()) {
      serviceLocator.registerSingleton(ApiService());
    }

    // Api Http Client
    if (!serviceLocator.isRegistered<ApiClient>()) {
      serviceLocator.registerSingleton(ApiClient());
    }
    if (!serviceLocator.isRegistered<SharedPreferencesService>()) {
      await SharedPreferencesService.getInstance(); // Ensure it's initialized
      serviceLocator.registerSingletonAsync(() => SharedPreferencesService.getInstance());
    }
  }
}
