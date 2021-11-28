import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

var lastRolled = 0;

class DiceRoute extends StatefulWidget {
  const DiceRoute({Key? key}) : super(key: key);

  @override
  DiceState createState() => DiceState();
}

class DiceState extends State<DiceRoute> {
  void rollDice(BuildContext context, var maxValue) {
    Random random = Random();
    var rnd = random.nextInt(maxValue) + 1;
    setState(() {
      lastRolled = rnd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
      ),
      body: Column(children: [
        Row(
          children: const [
            Text("Last rolled number:"),
          ],
        ),
        Row(
          children: [
            Text(lastRolled.toString()),
          ],
        ),
        Expanded(
          child: GridButton(
            onPressed: (var value) {
              rollDice(context, value);
            },
            items: const [
              [
                GridButtonItem(title: "D2", value: 2),
                GridButtonItem(title: "D4", value: 4),
                GridButtonItem(title: "D6", value: 6),
              ],
              [
                GridButtonItem(title: "D8", value: 8),
                GridButtonItem(title: "D10", value: 10),
                GridButtonItem(title: "D12", value: 12),
              ],
              [
                GridButtonItem(title: "D20", value: 20),
              ],
            ],
          ),
        ),
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
