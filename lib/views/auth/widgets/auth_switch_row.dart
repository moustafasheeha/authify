import 'package:authify/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthSwitchRow extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onTap;

  const AuthSwitchRow({
    super.key,
    required this.message,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        TextButton(
          onPressed: onTap,
          child: Text(
            actionText,
            style: const TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
