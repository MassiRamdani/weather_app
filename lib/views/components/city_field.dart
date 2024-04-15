import 'package:flutter/material.dart';

class CityField extends StatelessWidget {
  final Function(String)? onChanged;

  const CityField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Nom de la ville',
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: (value) {
        // Vérifie si la valeur n'est pas un nom de ville valide
        if (value!.isEmpty) {
          // Retourne un message d'erreur si le nom de ville n'est pas valide
          return 'Veuillez entrer une ville valide';
        }
        // Retourne null si la validation réussit
        return null;
      },
    );
  }
}
