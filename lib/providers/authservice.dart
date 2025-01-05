import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Connexion avec Google
  Future<User?> signInWithGoogle() async {
    try {
      // Étape 1 : Ouvrir la boîte de dialogue Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // Annulé par l'utilisateur
      }

      // Étape 2 : Obtenir l'authentification Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Étape 3 : Créer des informations d'identification Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Étape 4 : Connecter l'utilisateur
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user; // Retourne l'utilisateur connecté
    } catch (e) {
      throw Exception("Erreur lors de la connexion avec Google : $e");
    }
  }


  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Failed to login: $e");
    }
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Failed to sign up: $e");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
