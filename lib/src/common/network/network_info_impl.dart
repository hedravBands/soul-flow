import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    ConnectivityResult connectivityResult =
        await (connectionChecker.checkConnectivity());
    const offline = ConnectivityResult.none;

    return (connectivityResult != offline);
  }
}
