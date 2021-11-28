import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class DiceRoute extends StatelessWidget {
  const DiceRoute({Key? key}) : super(key: key);
  static const textStyle = TextStyle(fontSize: 26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
      ),
      body: Column(children: [
        // add table of dice buttons here
        Expanded(
          child: GridButton(
            onPressed: (var val) {
              Random random = Random();
              var rnd = random.nextInt(val)+1;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(rnd.toString()),
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },

            // onPressed: (var value) {
            //   // rollDice(value);
            // },
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
