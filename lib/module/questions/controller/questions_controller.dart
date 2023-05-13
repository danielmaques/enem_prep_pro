import 'package:flutter/material.dart';

class QuestionsController {
  final ValueNotifier<int> hourNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> minutesNotifier = ValueNotifier<int>(60);

  int get hour => hourNotifier.value;
  int get minutes => minutesNotifier.value;

  void decrementHour() {
    hourNotifier.value--;
  }

  void decrementMinutes() {
    minutesNotifier.value--;
    if (minutesNotifier.value < 0) {
      minutesNotifier.value = 59;
      decrementHour();
    }
  }

  void dispose() {
    hourNotifier.dispose();
    minutesNotifier.dispose();
  }
}
