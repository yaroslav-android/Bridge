import 'dart:math' as math;

import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(170 * math.pi / 180),
                  child: const BridgeCard(
                    // FIXME(onboarding): randomize rank & suit.
                    rank: 'T',
                    suit: 'S',
                    size: Size(448, 608), // FIXME(onboarding): extract card size.
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(200 * math.pi / 180),
                  child: const BridgeCard(
                    // FIXME(onboarding): randomize rank & suit.
                    rank: 'K',
                    suit: 'D',
                    size: Size(448, 608), // FIXME(onboarding): extract card size.
                  ),
                ),
              ],
            ),
          ),
          BridgeButton(
            onClick: () {
              // TODO(login): context.navigateToRegistration();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            child: const Text('Sign up'),
          ),
          BridgeButton(
            onClick: () {
              // TODO(login): context.navigateToLogin();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
