import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart' as login;
import 'package:onboarding/onboarding.dart' as onboarding;
import 'package:signup/signup.dart' as signup;

class AppRouter {
  AppRouter({required this.shouldShowOnboarding, required this.isLoggedIn}) {
    _router = GoRouter(
      routes: [
        /* Main Routes */
        GoRoute(
          path: '/',
          redirect: (_, __) {
            if (!isLoggedIn) {
              if (shouldShowOnboarding) return onboarding.onboardingRoute;
              return login.loginRoute;
            }
            return '/';
          },
          builder: (_, __) =>
              Placeholder(), // TODO(home): replace with real HomeScreen.
        ),

        /* Auth Routes */
        ShellRoute(
            builder: (context, state, child) {
              return MaterialApp(
                theme: ThemeData(
                  // TODO(theme): config theme.
                  primarySwatch: Colors.green,
                ),
                home: Scaffold(
                  body: SafeArea(
                    child: child,
                  ),
                ),
              );
            },
            routes: [
              _onboardingRoute,
              _loginRoute,
              _signUpRoute,
            ]),
      ],
    );
  }

  final bool shouldShowOnboarding;
  final bool isLoggedIn;

  late GoRouter _router;

  GoRouter get router => _router;

  final GoRoute _onboardingRoute = GoRoute(
    path: onboarding.onboardingRoute,
    builder: (context, state) => onboarding.OnboardingScreen(
      onLoginNavClick: () => context.navigateToLogin(),
      onSignUpNavClick: () => context.navigateToSignUp(),
    ),
  );

  final GoRoute _loginRoute = GoRoute(
    path: login.loginRoute,
    builder: (context, state) => login.LoginScreen(
      onNavBackClick: () => context.navigateToOnboarding(),
    ),
  );

  final GoRoute _signUpRoute = GoRoute(
    path: signup.signUpRoute,
    builder: (context, state) => signup.SignUpScreen(
      onNavBackClick: () => context.navigateToOnboarding(),
    ),
  );
}
