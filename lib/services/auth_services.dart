import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

  Future<User?> register(String email, String password) async {
    print("Registering user with email: $email");
    final user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

  Future<void> logout() async => await _auth.signOut();
}
