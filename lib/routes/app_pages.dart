import 'package:authify/core/bindings/splash_binding.dart';
import 'package:authify/routes/app_routes.dart';
import 'package:authify/views/splash/splash_view.dart';
import 'package:authify/views/home_view.dart';
import 'package:authify/views/auth/login_view.dart';
import 'package:authify/views/auth/register_view.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
  ];
}
