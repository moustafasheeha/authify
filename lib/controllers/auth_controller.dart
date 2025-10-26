import 'package:get/get.dart';
import 'package:authify/core/repo/i_auth_repo.dart';
import 'package:authify/core/errors/base_failure.dart';

class AuthController extends GetxController {
  final IAuthRepo _repo;

  AuthController(this._repo);
   static AuthController get to => Get.find<AuthController>();

  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _repo.authStateChanges.listen((loggedIn) {
      isLoggedIn.value = loggedIn;
      if (loggedIn) errorMessage.value = '';
    }, onError: (err) {
      errorMessage.value = 'Authentication status error.';
    });
  }

  Future<void> signUp({required String email, required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await _repo.signUp(email: email, password: password);
    } on BaseFailure catch (f) {
      errorMessage.value = f.message;
    } catch (e) {
      errorMessage.value = 'Unexpected error occurred.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await _repo.signIn(email: email, password: password);
    } on BaseFailure catch (f) {
      errorMessage.value = f.message;
    } catch (e) {
      errorMessage.value = 'Unexpected error occurred.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _repo.signOut();
    } on BaseFailure catch (f) {
      errorMessage.value = f.message;
    } catch (e) {
      errorMessage.value = 'Unexpected error while signing out.';
    }
  }
}
