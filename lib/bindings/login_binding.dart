import 'package:get/get.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/viewmodels/login_viewmodel.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Enregistrement de AuthenticationService en tant que dépendance injectable avec Get.lazyPut
    Get.lazyPut<AuthenticationService>(() => AuthenticationService());

    // Enregistrement de LoginViewModel en tant que dépendance injectable avec Get.lazyPut
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}
