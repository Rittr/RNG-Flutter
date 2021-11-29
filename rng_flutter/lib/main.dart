import 'package:flutter/material.dart';
import 'package:rng_flutter/dice.dart';
import 'package:rng_flutter/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RNG Flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Roll Dice"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DiceRoute()));
              },
            ),
            ElevatedButton(
              child: const Text("Choose from List"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ListRoute()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
