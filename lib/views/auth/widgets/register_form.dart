import 'package:authify/controllers/auth_controller.dart';
import 'package:authify/core/constants/app_strings.dart';
import 'package:authify/core/utils/app_validator.dart';
import 'package:authify/core/widgets/app_text_field.dart';
import 'package:authify/routes/app_routes.dart';
import 'package:authify/views/auth/widgets/auth_bottun.dart';
import 'package:authify/views/auth/widgets/auth_greeting.dart';
import 'package:authify/views/auth/widgets/auth_switch_row.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool hide = true;

  late GlobalKey<FormState> _formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthGreeting(isLogin: false),
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
          AppTextField(
            controller: confirmPasswordController,
            label: AppStrings.confirmPasswordLabel,
            validator: (value) => AppValidator.validateConfirmPassword(
              confirmedPassword: value ?? '',
              password: passwordController.text,
            ),
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
            title: AppStrings.registerButton,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                AuthController.to.signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          AuthSwitchRow(
            message: AppStrings.alreadyHaveAccount,
            actionText: AppStrings.loginButton,
            onTap: () {
              Get.offNamed(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
