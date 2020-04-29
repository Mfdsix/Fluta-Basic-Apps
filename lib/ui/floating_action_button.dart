import 'package:flutter/material.dart';

class FABExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Fab"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("Hello fab content"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_call),
        onPressed: () => debugPrint("You make new call"),
        backgroundColor: Colors.lightBlue,
        ),
    );
  }
}