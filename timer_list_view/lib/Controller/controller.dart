import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerItem {
  final TextEditingController controller = TextEditingController();
  final Rx<Duration> duration = Duration.zero.obs;
  final RxBool isRunning = false.obs;
  final RxString buttonText = 'Start'.obs;
  Timer? timer;
}

class TimerController extends GetxController {
  final RxList<TimerItem> timers = <TimerItem>[].obs;

  void addTimerItem() {
    timers.add(TimerItem());
  }

  void startPauseTimer(int index) {
    final timerItem = timers[index];

    if (timerItem.isRunning.value) {
      timerItem.isRunning.value = false;
      timerItem.buttonText.value = 'Start';
      timerItem.timer?.cancel();
    } else {
      final seconds = int.tryParse(timerItem.controller.text) ?? 0;
      if (seconds > 0) {
        final duration = Duration(seconds: seconds);
        timerItem.duration.value = duration;
        timerItem.isRunning.value = true;
        timerItem.buttonText.value = 'Pause';
        timerItem.timer = Timer.periodic(const Duration(seconds: 1), (_) {
          if (timerItem.duration.value.inSeconds <= 0) {
            timerItem.isRunning.value = false;
            timerItem.buttonText.value = 'Start';
            timerItem.timer?.cancel();
          } else {
            timerItem.duration.value -= const Duration(seconds: 1);
          }
        });
      }
    }
  }
}
