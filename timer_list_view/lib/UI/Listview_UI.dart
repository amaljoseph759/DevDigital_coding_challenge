import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';

class ListApp extends StatelessWidget {
  final TimerController timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Timer ListView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: timerController.timers.length,
              itemBuilder: (context, index) {
                final timerItem = timerController.timers[index];
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: timerItem.controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Seconds',
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Obx(() => Text(
                            timerItem.duration.value
                                .toString()
                                .substring(0, 10),
                          )),
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () => timerController.startPauseTimer(index),
                        child: Obx(() => Text(timerItem.buttonText.value)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: timerController.addTimerItem,
            child: const Text('Add Timer'),
          ),
        ],
      ),
    );
  }
}
