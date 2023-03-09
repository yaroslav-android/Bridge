import 'package:bridge/navigation/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// FIXME: hardcoded for now, replace with real values from a storage.
final appRouter = AppRouter(
  shouldShowOnboarding: true,
  isLoggedIn: false,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.router,
    );
  }
}
