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
          child:
              // GridButton(
              //   textStyle: textStyle,
              //   borderColor: Colors.grey[300],
              //   borderWidth: 2,
              //   onPressed: (dynamic val) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(val.toString()),
              //         duration: Duration(milliseconds: 400),
              //       ),
              //     );
              //   },
              //   items: [
              //     [
              //       GridButtonItem(
              //         title: "Black",
              //         color: Colors.black,
              //         textStyle: textStyle.copyWith(color: Colors.white),
              //       ),
              //       GridButtonItem(
              //         title: "Red",
              //         color: Colors.red,
              //         textStyle: textStyle.copyWith(color: Colors.white),
              //       ),
              //     ],
              //     [
              //       GridButtonItem(
              //           child: Icon(
              //             Icons.image_outlined,
              //             size: 50,
              //           ),
              //           textStyle: textStyle.copyWith(color: Colors.white),
              //           value: 'image',
              //           color: Colors.blue,
              //           shape: BorderSide(width: 4),
              //           borderRadius: 30)
              //     ],
              //     [
              //       GridButtonItem(title: "7"),
              //       GridButtonItem(title: "8"),
              //       GridButtonItem(title: "9"),
              //       GridButtonItem(title: "×", color: Colors.grey[300]),
              //     ],
              //     [
              //       GridButtonItem(title: "4"),
              //       GridButtonItem(title: "5"),
              //       GridButtonItem(title: "6"),
              //       GridButtonItem(title: "-", color: Colors.grey[300]),
              //     ],
              //     [
              //       GridButtonItem(title: "1"),
              //       GridButtonItem(title: "2"),
              //       GridButtonItem(title: "3"),
              //       GridButtonItem(title: "+", color: Colors.grey[300]),
              //     ],
              //     [
              //       GridButtonItem(title: "0"),
              //       GridButtonItem(title: "000", flex: 2, longPressValue: 400),
              //       GridButtonItem(title: "=", color: Colors.grey[300]),
              //     ],
              //   ],
              // ),

              GridButton(
            onPressed: (var val) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(val.toString()),
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },

            // onPressed: () {
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
