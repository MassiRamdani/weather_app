import 'package:get/get.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    // Enregistrement de WeatherService en tant que dépendance injectable avec Get.lazyPut
    Get.lazyPut<WeatherService>(() => WeatherService());

    // Enregistrement de WeatherViewModel en tant que dépendance injectable avec Get.lazyPut
    Get.lazyPut<WeatherViewModel>(() => WeatherViewModel());
  }
}
