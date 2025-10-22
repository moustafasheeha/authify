abstract class IAuthRepo {
  Future<void> signUp({required String email, required String password});

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  Stream<bool> get authStateChanges;
}
