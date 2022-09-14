import 'package:flutter/material.dart';

import 'src/common/routes/go_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  static const String title = 'GoRouter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: title,
    );
  }
}
