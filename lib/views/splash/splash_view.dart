import 'package:authify/views/splash/animated_letters.dart';
import 'package:authify/views/splash/animated_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:authify/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    const String appName = "Authify";
    const primaryColor = Color(0xFF1565C0);

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLetters(appName: appName),

            const SizedBox(height: 25),

            Animatedline(),
          ],
        ),
      ),
    );
  }
}
