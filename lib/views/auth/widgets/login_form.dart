import 'package:authify/controllers/auth_controller.dart';
import 'package:authify/core/constants/app_strings.dart';
import 'package:authify/core/utils/app_validator.dart';
import 'package:authify/core/widgets/app_text_field.dart';
import 'package:authify/routes/app_routes.dart';
import 'package:authify/views/auth/widgets/auth_bottun.dart';
import 'package:authify/views/auth/widgets/auth_greeting.dart';
import 'package:authify/views/auth/widgets/auth_switch_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hide = true;

  late GlobalKey<FormState> _formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthGreeting(isLogin: true),
          const SizedBox(height: 20),
          AppTextField(
            controller: emailController,
            label: AppStrings.emailLabel,
            validator: (value) => AppValidator.validateEmail(value),
          ),
          const SizedBox(height: 20),
          AppTextField(
            controller: passwordController,
            label: AppStrings.passwordLabel,
            validator: (value) => AppValidator.validatePassword(value),
            obscure: hide,
            suffix: IconButton(
              onPressed: () => setState(() => hide = !hide),
              icon: Icon(
                hide ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 20),
          AuthButton(
            title: AppStrings.loginButton,
            onPressed: AuthController.to.isLoading.value
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      AuthController.to.signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    }
                  },
          ),
          const SizedBox(height: 20),
          AuthSwitchRow(
            message: AppStrings.dontHaveAccount,
            actionText: AppStrings.registerButton,
            onTap: () {
              Get.offNamed(AppRoutes.register);
            },
          ),
        ],
      ),
    );
  }
}
