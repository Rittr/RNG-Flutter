import 'package:flutter/material.dart';

var itemList = [];
var addItemDialogController = TextEditingController();
var valueText = "";

class ListRoute extends StatefulWidget {
  const ListRoute({Key? key}) : super(key: key);

  @override
  ListState createState() => ListState();
}

class ListState extends State<ListRoute> {
  void addItem(var text) {}

  Future<void> addItemDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          // var addItemDialogController;
          return AlertDialog(
            title: Text("Add list item"),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  // itemList.add(value);
                  // print(itemList);
                  valueText = value;
                });
              },
              controller: addItemDialogController,
              decoration: InputDecoration(hintText: "Enter your item here"),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    // valueText = "";
                    addItemDialogController.clear();
                    // setState(() {
                    //   Navigator.pop(context);
                    //   valueText = "";
                    // });
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      itemList.add(valueText);
                      // print(itemList);
                      // Navigator.pop(context);
                      // valueText = "";
                    });
                    Navigator.pop(context);
                    // valueText = "";
                    addItemDialogController.clear();
                    print(itemList);
                  },
                  child: Text("Add")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Item Selector"),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Return to Home Screen'),
        ),
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


