import 'package:flutter/material.dart';

class AuthGreeting extends StatelessWidget { 
  final bool isLogin;

  const AuthGreeting({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    final title = isLogin ? 'Welcome Back 👋' : 'Create Account ✨';
    final subtitle = isLogin
        ? 'Sign in to continue'
        : 'Join us and start your journey';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
