import 'package:authify/views/auth/widgets/auth_container.dart';
import 'package:authify/views/auth/widgets/auth_banner.dart';
import 'package:authify/views/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: AuthContainer(child: LoginForm()),
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
