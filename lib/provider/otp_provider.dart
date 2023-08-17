import 'dart:async';
import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  OTPProvider();

  late Timer _timer;
  int time_count = 60;
  int? _start=60;

  bool _isloader=false;
  int? get start => _start;
  bool get isloader => _isloader;

  Future<void> startTimer(BuildContext context) async{
    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
        if (time_count == 0) {
          timer.cancel();
          _start=0;
        }
        else {
          time_count--;
          _start=time_count;
          notifyListeners();
        }
      },
    );
  }

  void setReStart(BuildContext context) {
    time_count = 60;
    _start = 60;
  }

  void setStopTime() {
    _timer.cancel();
  }

  Future closeloader() async{
    _isloader=false;
    notifyListeners();
  }
}
