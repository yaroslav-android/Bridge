import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/src/login_cubit.dart';
import 'package:login/src/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: LoginView(
        onNavBackClick: onNavBackClick,
      ),
    );
  }
}
