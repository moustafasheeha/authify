import 'package:authify/controllers/auth_controller.dart';
import 'package:authify/core/repo/firebase_auth_repo.dart';
import 'package:authify/core/repo/i_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    final firebaseAuth = Get.find<FirebaseAuth>();

    Get.lazyPut<IAuthRepo>(() => FirebaseAuthRepo(firebaseAuth));
    final repo = Get.find<IAuthRepo>();

    Get.lazyPut<AuthController>(() => AuthController(repo));
  }
}
