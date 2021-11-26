import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  String get url;
  get isConnected => null;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  final String _url;
  NetworkInfoImpl(this._connectivity, this._url);

  String get url => _url;

  @override
  Future<bool> get isConnected => isConnectedToNetwork();

  Future<bool> isConnectedToNetwork() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on Exception {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        /* case ConnectivityResult.none: */
        return true;
      default:
        return false;
    }
  }
}
