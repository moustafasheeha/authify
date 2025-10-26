import 'package:authify/core/constants/app_assets.dart';
import 'package:authify/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AppBrand extends StatelessWidget {
  final double logoSize;
  final double spacing;
  final double fontSize;
  final Color textColor;

  const AppBrand({
    super.key,
    this.logoSize = 100,
    this.spacing = 8,
    this.fontSize = 22,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.logo,
          width: logoSize,
          height: logoSize,
          fit: BoxFit.contain,
        ),
        SizedBox(height: spacing),
        Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
