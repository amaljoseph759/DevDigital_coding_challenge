import 'package:flutter/material.dart';

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: const Text('Timer ListView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: ListTile(
                    title: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Seconds',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          "1000000000".toString().substring(0, 10),
                        ),
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("start")),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
