import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailField extends StatelessWidget {
  final Function(String)? onChanged;

  const EmailField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.bodyMedium),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: (value) {
        // Vérifie si la valeur n'est pas une adresse e-mail valide
        if (!value!.isEmail) {
          // Retourne un message d'erreur si l'email n'est pas valide
          return 'Veuillez entrer une adresse e-mail valide';
        }
        // Retourne null si la validation réussit
        return null;
      },
    );
  }
}
