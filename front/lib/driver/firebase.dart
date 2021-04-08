import 'package:firebase_auth/firebase_auth.dart';

class Firebase {

  Future<UserCredential> authnWithEmailAndPassword(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }
}