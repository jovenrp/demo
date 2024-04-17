
import 'package:flutter/material.dart';
import 'package:nrd/application/utils/app_colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.warningOrange),
      child: const Icon(Icons.fastfood, size: 100, color: AppColors.lightText,)
    );
  }
}