import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/controller/change_notifier.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginInfo info = context.read<LoginInfo>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
        actions: <Widget>[
          IconButton(
            onPressed: info.logout,
            tooltip: 'Logout: ${info.userName}',
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        color: Colors.indigo,
      ),
    );
  }
}
