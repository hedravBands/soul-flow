import 'package:flutter/material.dart';
import 'package:soulflow/src/common/constant/note_strings.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailTextField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.dark,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: enterYourEmailHere,
      ),
    );
  }
}
