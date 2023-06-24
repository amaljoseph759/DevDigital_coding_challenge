import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';

class ListApp extends StatelessWidget {
  ListApp({super.key});
  final TimerController timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Timer ListView',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Obx(() => Expanded(
                child: ListView.builder(
                  itemCount: timerController.timers.length,
                  itemBuilder: (context, index) {
                    final timerItem = timerController.timers[index];

                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: ListTile(
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
                              onPressed: () =>
                                  timerController.startPauseTimer(index),
                              child:
                                  Obx(() => Text(timerItem.buttonText.value)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
            onPressed: timerController.addTimerItem,
            child: const Text('Add Timer'),
          ),
        ],
      ),
    );
  }
}
