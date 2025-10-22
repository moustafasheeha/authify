import 'package:authify/routes/app_routes.dart';
import 'package:authify/views/Splash_view.dart';
import 'package:authify/views/home_view.dart';
import 'package:authify/views/login_view.dart';
import 'package:authify/views/register_view.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
  ];
}
