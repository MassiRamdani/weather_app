// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/services/authentication_service.dart';

class LoginViewModel extends GetxController {
  String email = ''; // Email de l'utilisateur
  String password = ''; // Mot de passe de l'utilisateur

  final AuthenticationService authService =
      Get.find(); // Service d'authentification

  // Méthode pour se connecter
  Future<void> signIn() async {
    try {
      // Vérifie les informations d'identification avec le service d'authentification
      if (await authService.signIn(email, password)) {
        // Si la connexion réussit, navigue vers l'écran des prévisions météorologiques
        Get.toNamed('/weather');
        // Affiche un message de connexion réussie
        showSnackBar('Connexion réussie !');
      } else {
        // Si les informations de connexion sont incorrectes, affiche un message d'erreur
        showSnackBar('Erreur dans le mot de passe ou l\'adresse e-mail ');
      }
    } catch (error) {
      // En cas d'erreur lors de la connexion, affiche un message d'erreur avec les détails de l'erreur
      showSnackBar('Erreur lors de la connexion: $error');
    }
  }

  // Méthode pour afficher un SnackBar avec un message donné
  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message,
            style: GoogleFonts.roboto(
                color: Colors.white,
                textStyle: Theme.of(Get.context!).textTheme.bodyMedium)),
      ),
    );
  }
}
