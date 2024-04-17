import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrd/application/utils/app_colors.dart';
import 'package:nrd/application/widgets/custom_logo.dart';
import 'package:nrd/application/widgets/custom_password.dart';
import 'package:nrd/application/widgets/custom_textfield.dart';
import 'package:nrd/features/dashboard/presentation/dashboard_screen.dart';
import 'package:nrd/features/login/bloc/login_bloc.dart';
import 'package:nrd/features/login/bloc/login_state.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

import '../../../application/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';
  static const String screenName = 'loginScreen';

  static ModalRoute<LoginScreen> route() =>
      MaterialPageRoute<LoginScreen>(
          settings: const RouteSettings(name: routeName),
          builder: (_) => const LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state.hasError) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Invalid credentials', style: TextStyle(color: AppColors.lightText),),
              backgroundColor: AppColors.errorText,
            ));
          }
          if (!state.isLoading && state.isLoggedIn) {
            Navigator.of(context).pushReplacement(
              DashboardScreen.route(user: state.userModel ?? const UserModel()),
            );
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      child: CustomLogo(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: CustomTextfield(
                        controller: usernameController,
                        hint: 'username',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: CustomPassword(
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: CustomButton(
                          isLoading: state.isLoading,
                          buttonText: 'LOGIN',
                          onPressed: () => context.read<LoginBloc>().login(
                              username: usernameController.text,
                              password: passwordController.text),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
