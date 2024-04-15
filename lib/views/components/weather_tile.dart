import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather; // Données météorologiques associées à cette tuile

  // Constructeur de la classe WeatherTile prenant une instance de Weather en paramètre
  const WeatherTile({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.deepPurple.withOpacity(0.05),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          // Titre de la Tile affichant la date et l'heure au format spécifié
          title: Text(
            'Date: ${DateFormat('dd/MM/yyyy à HH:mm').format(weather.date)}',
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium),
          ),
          // Sous-titre de la Tile affichant la température
          subtitle: Text(
            'Temperature: ${weather.temperature}°C', // Température au format °C
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium),
          ),
          trailing: Text(
            weather.city, // Le nom de la ville
            style: GoogleFonts.roboto(
                color: Colors.grey,
                textStyle: Theme.of(context).textTheme.bodySmall),
          ),
          // Image affichant l'icône météorologique correspondante à la Tile
          leading: CircleAvatar(
              backgroundColor: Colors.deepPurple
                  .withOpacity(0.3), // Couleur de fond du cercle
              radius: 30, // Rayon du cercle
              child: Image.network(
                  weather.icon)), // Chargement de l'image depuis une URL réseau
        ));
  }
}
