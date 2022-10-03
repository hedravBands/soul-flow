import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../route/router_utils.dart';
import '../service/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_PAGE.login.toTitle),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                authService.login();
              },
              child: const Text("Log in as a Guest"),
            ),
          ],
        ),
      ),
    );
  }
}
