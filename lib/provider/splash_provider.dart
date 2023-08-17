import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoading_Network = false;
  bool get isLoading_Network => _isLoading_Network;
  bool _isNetwork = true;
  bool get isNetwork => _isNetwork;
  Future<void> setConnectionCheck(BuildContext context) async {
    _isLoading_Network=true;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      _isLoading_Network = false;
      _isNetwork=true;
      notifyListeners();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      _isLoading_Network = false;
      _isNetwork=true;
      notifyListeners();
    }else{
      _isLoading_Network = false;
      _isNetwork=false;
      notifyListeners();
    }
  }
}
