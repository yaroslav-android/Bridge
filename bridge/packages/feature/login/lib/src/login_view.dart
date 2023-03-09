import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/src/login_cubit.dart';
import 'package:login/src/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        Icon icon;
        if (state.isTextObscured) {
          icon = const Icon(Icons.visibility_off);
        } else {
          icon = const Icon(Icons.visibility);
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    onNavBackClick?.call();
                  },
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (value) =>
                    context.read<LoginCubit>().setEmail(value),
              ),
            ),
            const SizedBox(
              height: 32,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                obscureText: state.isTextObscured,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: icon,
                    onPressed: () {
                      context.read<LoginCubit>().toggleObscureText();
                    },
                  ),
                ),
                onChanged: (value) =>
                    context.read<LoginCubit>().setPassword(value),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BridgeButton(
                onClick: () {},
                child: const Text('Log in'),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
