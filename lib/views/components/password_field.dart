import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatelessWidget {
  final Function(String)? onChanged;

  const PasswordField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Mot de passe',
        hintStyle: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.bodyMedium),
      ),
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: (value) {
        // Vérifie si le champ du mot de passe est vide
        if (value!.isEmpty) {
          // Retourne un message d'erreur si le champ du mot de passe est vide
          return 'Veuillez entrer un mot de passe valide';
        }
        // Retourne null si la validation réussit
        return null;
      },
    );
  }
}
