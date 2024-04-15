// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/login_screen.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('Affichage de l\'écran de connexion',
        (WidgetTester tester) async {
      // Construire l'écran de connexion
      await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(),
      ));

      // Attendre que les widgets soient rendus
      await tester.pumpAndSettle();

      // Vérifier si le texte "Login" est affiché dans l'appbar
      expect(find.text('Login'), findsOneWidget);

      // Vérifier si les champs de saisie pour l'email et le mot de passe sont affichés
      expect(find.byType(TextFormField), findsNWidgets(2));

      // Vérifier si le bouton "Valider" est affiché
      expect(find.text('Valider'), findsOneWidget);
    });
  });
}
