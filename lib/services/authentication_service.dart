import 'dart:async';

import 'package:weather_app/models/user.dart';

class AuthenticationService {
  // Définition d'un utilisateur fictif avec des information de test
  final User _fakeUser = User(
    email: 'test@test.com',
    password: '123456',
    firstName: 'RAMDANI',
    lastName: 'Massinissa',
  );

// Méthode pour obtenir l'utilisateur fictif
  User getFakeUser() {
    return _fakeUser;
  }

  Future<bool> signIn(String email, String password) async {
    // Vérifiez si les informations d'identification correspondent à lutilisateur factice
    if (email == _fakeUser.email && password == _fakeUser.password) {
      return true; // Connexion réussie
    } else {
      return false; // Connexion échouée
    }
  }
}
