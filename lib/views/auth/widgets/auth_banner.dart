import 'package:authify/core/constants/app_colors.dart';
import 'package:authify/core/widgets/app_brand.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthBanner extends StatelessWidget {
  const AuthBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child:  
      AppBrand(
        logoSize: 150,
        spacing: 12,
        fontSize: 26,
        textColor: Colors.white,
      ),
    );
  }
}

