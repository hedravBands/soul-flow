import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/features/feat1/page1_screen.dart';
import 'src/features/feat2/page2_screen.dart';

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
            const Page1Screen(),
        routes: <GoRoute>[
          GoRoute(
            path: 'page2',
            builder: (BuildContext context, GoRouterState state) =>
                const Page2Screen(),
          ),
        ],
      ),
    ],
  );
}
