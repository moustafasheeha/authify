import 'package:authify/controllers/auth_controller.dart';
import 'package:authify/core/constants/app_colors.dart';
import 'package:authify/core/constants/app_strings.dart';
import 'package:authify/views/auth/widgets/auth_bottun.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                AppStrings.welcomeAuthfiy,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AuthButton(
              title: AppStrings.signOut,
              onPressed: () => AuthController.to.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
