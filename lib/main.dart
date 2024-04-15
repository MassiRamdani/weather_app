import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/bindings/login_binding.dart';
import 'package:weather_app/bindings/weather_binding.dart';
import 'package:weather_app/views/login_screen.dart';
import 'package:weather_app/views/weather_screen.dart';

// Cette fonction est le point d'entrée de l'application Flutter.
// Elle exécute l'application en appelant runApp avec l'instance de MyApp.
void main() {
  runApp(const MyApp());
}

// MyApp est un widget StatelessWidget qui définit la structure de base de l'application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // La méthode build est appelée pour construire et retourner la hiérarchie de widgets de l'application.
  @override
  Widget build(BuildContext context) {
    // GetMaterialApp est un widget fourni par le package GetX qui gère la navigation et les routes de l'application.
    return GetMaterialApp(
      title: 'Weather app', // Titre de l'application
      initialRoute: '/login', // Route initiale de l'application
      debugShowCheckedModeBanner: false, // Désactiver la bannière de débogage
      onGenerateRoute: (settings) {
        // Fonction appelée pour générer les routes dynamiquement
        switch (settings.name) {
          case '/login':
            // Retourne une route vers l'écran de connexion (LoginScreen)
            // avec le binding LoginBinding pour gérer l'état et les dépendances.
            return GetPageRoute(
              settings: settings,
              page: () => const LoginScreen(),
              binding: LoginBinding(),
            );
          case '/weather':
            // Retourne une route vers l'écran météo (WeatherScreen)
            // avec le binding WeatherBinding pour gérer l'état et les dépendances.
            return GetPageRoute(
              settings: settings,
              page: () => const WeatherScreen(),
              binding: WeatherBinding(),
            );
          default:
            return null; // Gérer les autres routes ici si nécessaire
        }
      },
    );
  }
}
