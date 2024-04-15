import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Valider',
          style: GoogleFonts.roboto(
              color: Colors.deepPurple,
              textStyle: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}
