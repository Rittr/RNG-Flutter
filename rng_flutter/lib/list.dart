import 'dart:math';

import 'package:flutter/material.dart';

var itemList = [];
var addItemDialogController = TextEditingController();
var valueText = "";
var chosenItem = "None";

class ListRoute extends StatefulWidget {
  const ListRoute({Key? key}) : super(key: key);

  @override
  ListState createState() => ListState();
}

class ListState extends State<ListRoute> {
  void roll(BuildContext context) {
    Random random = Random();
    var rnd = random.nextInt(itemList.length);
    setState(() {
      chosenItem = itemList[rnd];
    });
  }

  Future<void> addItemDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add list item"),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: addItemDialogController,
              decoration:
                  const InputDecoration(hintText: "Enter your item here"),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    addItemDialogController.clear();
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      itemList.add(valueText);
                    });
                    Navigator.pop(context);
                    addItemDialogController.clear();
                  },
                  child: const Text("Add")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [const Divider()];
    for (var item in itemList) {
      widgetList.add(Center(
        child: Text(item),
      ));
      widgetList.add(const Divider());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("List Item Selector"),
      ),
      body: Column(children: [
        const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Last rolled item:",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              chosenItem,
              style: const TextStyle(fontSize: 45),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: widgetList,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              roll(context);
            },
            child: const Text('Roll!'),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                itemList.clear();
              });
            },
            child: const Text('Clear list'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                itemList.removeLast();
              });
            },
            child: const Text('Remove last item'),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Return to Home Screen'),
          ),
        ]),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItemDialog(context);
        },
        tooltip: 'Add List Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
