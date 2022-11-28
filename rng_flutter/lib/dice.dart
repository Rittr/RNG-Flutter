import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

var lastRolled = 0;
var lastMax = 0;

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
      lastMax = maxValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
      ),
      body: Column(children: [
        const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Last rolled number:",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lastRolled.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              "/" + lastMax.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
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
              [
                GridButtonItem(title: "D100", value: 100),
                GridButtonItem(title: "D1000", value: 1000),
              ],
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Return to Home Screen'),
          ),
        ]),
      ]),
    );
  }
}
