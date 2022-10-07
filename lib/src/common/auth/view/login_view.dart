import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:soulflow/src/common/auth/view/widgets/login_button.dart';

import '../../extensions/if_debugging.dart';
import 'widgets/email_text_field.dart';
import 'widgets/password_text_field.dart';

class LoginView extends HookWidget {
  final OnLoginTapped onLoginTapped;
  const LoginView({
    required this.onLoginTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'foo@bar.car'.ifDebugging,
    );

    final passwordController = useTextEditingController(
      text: 'foobar'.ifDebugging,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            EmailTextField(
              emailController: emailController,
            ),
            PasswordTextField(
              passwordController: passwordController,
            ),
            LoginButton(
              emailController: emailController,
              passwordController: passwordController,
              onLoginTapped: onLoginTapped,
            ),
            // TextButton(
            //   onPressed: () {
            //     final email = emailController.text;
            //     final password = passwordController.text;
            //     context.read<AppBloc>().add(
            //           AppEventLogIn(
            //             email: email,
            //             password: password,
            //           ),
            //         );
            //   },
            //   child: const Text(
            //     'Log in',
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     context.read<AppBloc>().add(
            //           const AppEventGoToRegistration(),
            //         );
            //   },
            //   child: const Text(
            //     'Not registered yet? Register here!',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
