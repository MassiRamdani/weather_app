import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/user.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherViewModel extends GetxController {
  final WeatherService _weatherService =
      Get.find(); // Instance du service de prévisions météorologiques
  final AuthenticationService _authService =
      Get.find(); // Instance du service d'authentification
  final forecast =
      <Weather>[].obs; // Liste observable des prévisions météorologiques
  final user = User().obs; // Utilisateur observable
  final isLoading = false.obs; // Indicateur de chargement observable

  @override
  void onInit() async {
    super.onInit();
    loadWeatherForecast(
        "paris"); // Chargement des prévisions météorologiques lors de l'initialisation du ViewModel
    user(_authService
        .getFakeUser()); // Récupération de l'utilisateur fictif depuis le service d'authentification
  }

  // Méthode pour charger les prévisions météorologiques
  Future<void> loadWeatherForecast(String city) async {
    isLoading(
        true); // Définir isLoading sur true pour indiquer le chargement en cours
    try {
      // Chargement des prévisions météorologiques depuis le service
      forecast(await _weatherService.getWeatherForecast(
          city)); // Appel asynchrone à la méthode de service
    } catch (e) {
      // Gérer les erreurs de chargement des prévisions météorologiques
      showSnackBar(
          'Erreur lors du chargement des prévisions météorologiques: $e');
    }
    isLoading(
        false); // Définir isLoading sur false pour indiquer que le chargement est terminé
  }

  // Méthode pour afficher un SnackBar avec un message donné
  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message,
            style: GoogleFonts.roboto(
                color: Colors.white,
                textStyle: Theme.of(Get.context!)
                    .textTheme
                    .bodyMedium)), // Contenu du SnackBar
      ),
    );
  }
}
