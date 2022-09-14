import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/change_notifier.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Login Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // log a user in, letting all the listeners know
                  context.read<LoginInfo>().login('test-user');

                  // router will automatically redirect from /login to / using
                  // refreshListenable
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      );
}
