import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../aurora/10-splash/ui/splash_screen.dart';
import '../aurora/20-load/ui/loading_screen.dart';
import '../auth/ui/auth_screen.dart';
import '../game/ui/game_screen.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
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
    builder: (BuildContext context, GoRouterState state) => const AuthScreen(),
  ),
  GoRoute(
    path: '/game',
    builder: (BuildContext context, GoRouterState) => const GameScreen(),
  ),
]);
