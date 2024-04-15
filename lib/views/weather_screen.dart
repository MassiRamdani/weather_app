import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';
import 'package:weather_app/views/components/city_field.dart';
import 'package:weather_app/views/components/weather_tile.dart';

// Classe représentant l'écran des prévisions météorologiques
class WeatherScreen extends GetView<WeatherViewModel> {
  const WeatherScreen({super.key}); // Constructeur de la classe WeatherScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Retourne un Scaffold
      appBar: AppBar(
        // Barre d'applications
        centerTitle: true, // Centre le titre
        title: Text(
          // Titre de l'AppBar
          'Bienvenue ${controller.user.value.firstName}',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _displaySearchDialog(context);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        // Corps de l'écran centré
        child: Obx(() => !controller.isLoading.value
            ? Column(
                // Si isLoading est false, affiche la colonne avec les prévisions météorologiques
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.forecast.isNotEmpty
                      ? Expanded(
                          // Si elle n'est pas vide, affiche la ListView pour afficher les prévisions
                          child: ListView.builder(
                            // Constructeur de ListView dynamique
                            itemCount: controller.forecast.length,
                            itemBuilder: (context, index) {
                              // Constructeur pour chaque élément de la liste
                              final weather = controller.forecast[index];
                              // Récupération des données météorologiques à l'index actuel
                              return WeatherTile(
                                // Retourne le composant WeatherTile avec les données météorologiques correspondantes
                                weather: weather,
                              );
                            },
                          ),
                        )
                      : Center(
                          // Si la liste de prévisions est vide, affiche un message
                          child: Text(
                            // Texte indiquant l'absence de données
                            "Aucune donnée n'a été récupérée.",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                ],
              )
            : const CircularProgressIndicator()), // Si isLoading est true, affiche une indication de chargement
      ),
    );
  }

  // Fonction pour afficher une boîte de dialogue permettant à l'utilisateur de rechercher la météo d'une ville
  void _displaySearchDialog(BuildContext context) async {
    // Observable pour stocker le nom de la ville saisi par l'utilisateur
    final cityName = "".obs;

    // Afficher la boîte de dialogue modale
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Titre de la boîte de dialogue
          title: Text(
            "Météo d'une ville",
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          // Contenu de la boîte de dialogue
          content: CityField(
            onChanged: (value) => cityName(value),
          ),
          // Actions de la boîte de dialogue
          actions: <Widget>[
            // Bouton "Annuler"
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red.withOpacity(0.2);
                    }
                    return null;
                  },
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Annuler",
                style: GoogleFonts.roboto(
                  color: Colors.red,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            // Bouton "Rechercher"
            Obx(
              () => TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context).primaryColor.withOpacity(0.2);
                      }
                      return null;
                    },
                  ),
                ),
                onPressed: cityName.isEmpty
                    ? null
                    : () {
                        controller.loadWeatherForecast(cityName.value);
                        Navigator.of(context).pop();
                      },
                child: Text(
                  "Rechercher",
                  style: GoogleFonts.roboto(
                    color: Theme.of(context).primaryColor,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
