import 'package:authify/core/constants/app_colors.dart';
import 'package:authify/views/auth/widgets/auth_container.dart';
import 'package:authify/views/auth/widgets/auth_header.dart';
import 'package:authify/views/auth/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Stack(
                  children: [
                    const AuthBanner(),
                    const Positioned(
                      top: 250,
                      left: 20,
                      right: 20,
                      child: AuthContainer(
                        child: RegisterForm(),
                      )
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
