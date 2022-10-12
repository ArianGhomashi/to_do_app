import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notifier = ValueNotifier(0);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                notifier.value = notifier.value + 1;
              },
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
