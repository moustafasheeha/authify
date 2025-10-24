import 'package:authify/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find<SplashController>();
  final opacity = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), _navigateBasedOnAuthStatus);
  }

  Future<void> _navigateBasedOnAuthStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
