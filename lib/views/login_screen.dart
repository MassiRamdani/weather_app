import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/viewmodels/login_viewmodel.dart';
import 'package:weather_app/views/components/email_field.dart';
import 'package:weather_app/views/components/login_button.dart';
import 'package:weather_app/views/components/password_field.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login', // Titre de l'écran
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Champ d'email avec gestionnaire de changement
              EmailField(
                onChanged: (value) => controller.email = value,
              ),
              const SizedBox(height: 20.0),
              // Champ de mot de passe avec gestionnaire de changement
              PasswordField(
                onChanged: (value) => controller.password = value,
              ),
              const SizedBox(height: 20.0),
              // Bouton de connexion avec gestionnaire d'événements
              LoginButton(
                onPressed: () {
                  // Appeler la méthode signIn du viewmodel pour gérer la connexion
                  controller.signIn();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
