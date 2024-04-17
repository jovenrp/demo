import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrd/application/utils/app_colors.dart';
import 'package:nrd/application/widgets/spinner_loader.dart';
import 'package:nrd/features/login/presentation/login_screen.dart';

import '../../../generated/assets.gen.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';
  static const String screenName = 'splashScreen';

  static ModalRoute<SplashScreen> route() => MaterialPageRoute<SplashScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen(),
      );

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().loadSplashScreen();
    return BlocConsumer<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state) {
      if (!state.isLoading) {
        Navigator.of(context).pushReplacement(
          LoginScreen.route(),
        );
      }
    }, builder: (BuildContext context, SplashState state) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SpinnerLoader(),
            )
          ],
        ),
      );
    });
  }
}
