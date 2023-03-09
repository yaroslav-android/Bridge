import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/src/signup_cubit.dart';
import 'package:signup/src/signup_state.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final iconPassword = _getIcon(isTextObscured: state.isPasswordObscured);
        final iconConfirmPassword =
            _getIcon(isTextObscured: state.isConfirmPasswordObscured);

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
                  labelText: 'Nickname',
                ),
                onChanged: (value) =>
                    context.read<SignUpCubit>().setNickname(value),
              ),
            ),
            const SizedBox(
              height: 32,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (value) =>
                    context.read<SignUpCubit>().setEmail(value),
              ),
            ),
            const SizedBox(
              height: 32,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                obscureText: state.isPasswordObscured,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: iconPassword,
                    onPressed: () {
                      context.read<SignUpCubit>().toggleObscurePassword();
                    },
                  ),
                ),
                onChanged: (value) =>
                    context.read<SignUpCubit>().setPassword(value),
              ),
            ),
            const SizedBox(
              height: 32,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                obscureText: state.isConfirmPasswordObscured,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm password',
                  suffixIcon: IconButton(
                    icon: iconConfirmPassword,
                    onPressed: () {
                      context
                          .read<SignUpCubit>()
                          .toggleObscureConfirmPassword();
                    },
                  ),
                ),
                onChanged: (value) =>
                    context.read<SignUpCubit>().setConfirmPassword(value),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BridgeButton(
                onClick: () {},
                child: const Text('Sign up'),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }

  Icon _getIcon({required bool isTextObscured}) {
    Icon icon;
    if (isTextObscured) {
      icon = const Icon(Icons.visibility_off);
    } else {
      icon = const Icon(Icons.visibility);
    }

    return icon;
  }
}
