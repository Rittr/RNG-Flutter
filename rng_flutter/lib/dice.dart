import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class DiceRoute extends StatelessWidget {
  const DiceRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
      ),
      body: Column(children: [
        // add table of dice buttons here
        Row(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ]),
      ]),
    );
  }
}
