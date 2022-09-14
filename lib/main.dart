import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soulflow/src/common/auth/ui/auth_screen.dart';
import 'package:soulflow/src/common/game/ui/game_screen.dart';

import 'src/common/aurora/10-splash/ui/splash_screen.dart';
import 'src/common/aurora/20-load/ui/loading_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  static const String title = 'GoRouter: Declarative Routes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: title,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
        routes: <GoRoute>[],
      ),
      GoRoute(
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) =>
            const LoadingScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (BuildContext context, GoRouterState state) =>
            const AuthScreen(),
      ),
      GoRoute(
        path: '/game',
        builder: (BuildContext context, GoRouterState) => const GameScreen(),
      ),
    ],
  );
}
