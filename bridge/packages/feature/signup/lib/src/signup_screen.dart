import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/src/signup_cubit.dart';
import 'package:signup/src/signup_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: SignUpView(
        onNavBackClick: onNavBackClick,
      ),
    );
  }
}
