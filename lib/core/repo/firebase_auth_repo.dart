import 'package:firebase_auth/firebase_auth.dart';
import 'package:authify/core/repo/i_auth_repo.dart';
import 'package:authify/core/errors/firebase_failure.dart';

class FirebaseAuthRepo implements IAuthRepo {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepo(this._firebaseAuth);

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseFailure.fromCode(e.code, message: e.message);
    } catch (_) {
      throw const FirebaseFailure(
        'An unexpected error occurred. Please try again.',
      );
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseFailure.fromCode(e.code, message: e.message);
    } catch (_) {
      throw const FirebaseFailure(
        'An unexpected error occurred. Please try again.',
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseFailure.fromCode(e.code, message: e.message);
    } catch (_) {
      throw const FirebaseFailure('Failed to sign out. Please try again.');
    }
  }

  @override
  Stream<bool> get authStateChanges =>
      _firebaseAuth.authStateChanges().map((user) => user != null);
}
