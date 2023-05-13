// countdown_controller.dart
import 'dart:async';

import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier {
  final ValueNotifier<int> _remainingDays;

  HomeController(DateTime endDateTime)
      : _remainingDays = ValueNotifier(endDateTime.difference(DateTime.now()).inDays) {
    Timer.periodic(const Duration(days: 1), (timer) {
      int remaining = endDateTime.difference(DateTime.now()).inDays;
      if (remaining <= 0) {
        timer.cancel();
      } else {
        _remainingDays.value = remaining;
      }
    });
  }

  ValueNotifier<int> get remainingDays => _remainingDays;
}
