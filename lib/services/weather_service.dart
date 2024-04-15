import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/constants.dart';

// Définition de la classe WeatherService pour gérer les requêtes météorologiques
class WeatherService {
  // Méthode asynchrone pour récupérer les prévisions météorologiques pour une ville donnée
  Future<List<Weather>> getWeatherForecast(String city) async {
    // Construction de l'URL de l'API météo avec le nom de la ville et la clé d'API
    final url = '$baseUrl?q=$city&appid=$apiKey&units=metric';

    // Envoi d'une requête GET à l'URL construite en utilisant la bibliothèque http
    final response = await http.get(Uri.parse(url));

    // Vérification du code de statut de la réponse
    if (response.statusCode == 200) {
      // Si le code de statut est 200 (OK), traitement des données JSON de la réponse
      final jsonData = json.decode(response.body);
      final List<Weather> forecast = [];

      // Parsing des données pour extraire les prévisions météorologiques
      for (var item in jsonData['list']) {
        final weather = Weather(
          // Création d'une instance de Weather en utilisant les données JSON
          icon: '$iconBaseURL${item['weather'][0]['icon']}@2x.png',
          date: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
          temperature: item['main']['temp'].toDouble(),
          city: city.capitalizeFirst ?? "",
        );
        forecast.add(
            weather); // Ajout de l'instance de Weather à la liste des prévisions météorologiques
      }

      return forecast; // Retourne la liste des prévisions météorologiques
    } else {
      // Si le code de statut n'est pas 200, lance une exception avec un message d'erreur
      throw Exception('Échec du chargement des prévisions météorologiques.');
    }
  }
}
