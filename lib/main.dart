import 'package:authify/core/bindings/auth_binding.dart';
import 'package:authify/core/constants/app_transitions.dart';
import 'package:authify/firebase_options.dart';
import 'package:authify/routes/app_pages.dart';
import 'package:authify/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      defaultTransition: AppTransitions.defaultTransition,
      transitionDuration: AppTransitions.defaultDuration,
    );
  }
}
