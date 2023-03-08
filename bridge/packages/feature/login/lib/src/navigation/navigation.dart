import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String onboardingRoute = 'login';

extension OnboardingNavigation on BuildContext {
  void navigateToLogin() => go(onboardingRoute);
}
