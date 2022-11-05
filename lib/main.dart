import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulflow/src/common/auth/service/app_service.dart';

import 'injection_container.dart' as di;
import 'src/common/auth/service/auth_service.dart';
import 'src/common/route/app_router.dart';

final sanctumProviderList = [
  rp.StateProvider((ref) => 0),
  rp.StateProvider((ref) => 0),
  rp.StateProvider((ref) => 0),
  rp.StateProvider((ref) => 0),
  rp.StateProvider((ref) => 0),
  rp.StateProvider((ref) => 0),
];

abstract class WebsocketClient {
  Stream<int> getCounterStream();
}

class FakeWebsocketClient implements WebsocketClient {
  @override
  Stream<int> getCounterStream() async* {
    int i = 0;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i++;
    }
  }
}

final websocketClientProvider = rp.Provider<WebsocketClient>((ref) {
  return FakeWebsocketClient();
});

final eventProvider = rp.StreamProvider<int>((ref) {
  final wsClient = ref.watch(websocketClientProvider);
  return wsClient.getCounterStream();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(rp.ProviderScope(
    child: MyApp(sharedPreferences: sharedPreferences),
  ));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({
    Key? key,
    required this.sharedPreferences,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppService appService;
  late AuthService authService;
  late StreamSubscription<bool> authSubscription;

  @override
  void initState() {
    appService = AppService(widget.sharedPreferences);
    authService = AuthService();
    authSubscription = authService.onAuthStateChange.listen(onAuthStateChange);
    super.initState();
  }

  void onAuthStateChange(bool login) {
    appService.loginState = login;
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppService>(create: (_) => appService),
        Provider<AppRouter>(create: (_) => AppRouter(appService)),
        Provider<AuthService>(create: (_) => authService),
      ],
      child: Builder(
        builder: (context) {
          final GoRouter goRouter =
              Provider.of<AppRouter>(context, listen: false).router;
          return MaterialApp.router(
            routeInformationProvider: goRouter.routeInformationProvider,
            routeInformationParser: goRouter.routeInformationParser,
            routerDelegate: goRouter.routerDelegate,
            title: "Router Soul Flow",
          );
        },
      ),
    );
  }
}
