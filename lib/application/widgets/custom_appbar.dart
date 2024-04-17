import 'package:flutter/material.dart';
import 'package:nrd/application/utils/app_colors.dart';
import 'package:nrd/features/login/presentation/login_screen.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, this.onPressed, this.icon, this.color});

  final GestureTapCallback? onPressed;
  final Icon? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? AppColors.warningOrange,
      leading: GestureDetector(
        onTap: onPressed ?? () {
          Navigator.of(context).pushReplacement(
            LoginScreen.route(),
          );
        },
        child: icon ?? const RotatedBox(
          quarterTurns: 2,
          child: Icon(
            Icons.exit_to_app_rounded,
            color: AppColors.lightText,
          ),
        ),
      ),
    );
  }
}
