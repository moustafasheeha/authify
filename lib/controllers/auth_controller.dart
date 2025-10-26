import 'package:authify/core/constants/app_strings.dart';
import 'package:authify/core/widgets/app_snackbar.dart';
import 'package:authify/routes/app_routes.dart';
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
    _repo.authStateChanges.listen(
      (loggedIn) {
        isLoggedIn.value = loggedIn;
        if (loggedIn) errorMessage.value = '';
      },
      onError: (err) {
        errorMessage.value = AppStrings.authStatusError;
      },
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await _repo.signUp(email: email, password: password);
      AppSnackbar.show(
        title: AppStrings.success,
        message: AppStrings.accountCreated,
      );
      Get.offAllNamed(AppRoutes.home);
    } on BaseFailure catch (f) {
      errorMessage.value = f.message;
      AppSnackbar.show(
        title: AppStrings.error,
        message: f.message,
        isError: true,
      );
    } catch (e) {
      errorMessage.value = AppStrings.unexpectedError;
      Get.snackbar(AppStrings.error, AppStrings.unexpectedError);
      AppSnackbar.show(
        title: AppStrings.error,
        message: AppStrings.unexpectedError + e.toString(),
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await _repo.signIn(email: email, password: password);
      AppSnackbar.show(
        title: AppStrings.success,
        message: AppStrings.loginSuccess,
      );
      Get.offAllNamed(AppRoutes.home);
    } on BaseFailure catch (f) {
      errorMessage.value = f.message;
      AppSnackbar.show(
        title: AppStrings.error,
        message: f.message,
        isError: true,
      );
    } catch (e) {
      errorMessage.value = AppStrings.unexpectedError;
      AppSnackbar.show(
        title: AppStrings.error,
        message: AppStrings.unexpectedError + e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await _repo.signOut();
      AppSnackbar.show(
        title: AppStrings.signOutSuccess,
        message: AppStrings.signOutSuccess,
      );
      Get.offAllNamed(AppRoutes.login);
    } on BaseFailure catch (f) {
      errorMessage.value = f.message;
      AppSnackbar.show(
        title: AppStrings.error,
        message: f.message,
        isError: true,
      );
    } catch (e) {
      errorMessage.value = AppStrings.signOutError;
      AppSnackbar.show(
        title: AppStrings.error,
        message: AppStrings.signOutError + e.toString(),
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
