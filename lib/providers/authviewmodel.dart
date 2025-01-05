import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/providers/authservice.dart';

class Authviewmodel extends ChangeNotifier {
final AuthService _authService = AuthService();



Future<bool> login(
String email, String password, BuildContext context) async {
try {
final user = await _authService.loginWithEmail(email, password);
notifyListeners(); // Notifie les widgets que l'état a changé
return user != null;
} catch (e) {
ScaffoldMessenger.of(context)
.showSnackBar(SnackBar(content: Text(e.toString())));
notifyListeners();
return false;
}
}
// Connexion avec Google
  Future<bool> loginWithGoogle(BuildContext context) async {
    try {
      final user = await _authService.signInWithGoogle();
      notifyListeners(); // Notifie les changements d'état
      return user != null;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erreur: $e")));
      notifyListeners();
      return false;
    }
  }

 Future<bool> signUp(String email, String password, BuildContext context) async {
    try {
      final user = await _authService.signUpWithEmail(email, password);
      notifyListeners();
      return user != null;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      notifyListeners();
      return false;
    }
  }

Future<void> logout(BuildContext context) async {
try {
await _authService.logout();
notifyListeners();
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("Vous avez été déconnecté avec succès.")),
);
} catch (e) {
notifyListeners();

ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Erreur lors de la déconnexion : $e")),
);
}
}

void clearError() {
notifyListeners();
}
}