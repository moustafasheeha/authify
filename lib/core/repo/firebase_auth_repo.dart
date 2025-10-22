import 'package:authify/core/repo/i_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthRepo implements IAuthRepo {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepo(this._firebaseAuth);

  @override
  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<bool> get authStateChanges =>
      _firebaseAuth.authStateChanges().map((user) => user != null);
}
