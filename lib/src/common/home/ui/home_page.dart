import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../auth/service/auth_service.dart';
import '../../routes/router_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_PAGE.home.toTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                authService.logOut();
              },
              child: const Text("Log out"),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context)
                    .goNamed(APP_PAGE.error.toName, extra: "Erro from Home");
              },
              child: const Text("Show Error"),
            ),
          ],
        ),
      ),
    );
  }
}
