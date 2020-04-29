import 'package:flutter/material.dart';

class GestureDetectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Gesture"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: CustomeGestureDetector(),
        ),
    );
  }
}

class CustomeGestureDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(
          content: Text(
            "Hello snackbar",
            style: TextStyle(
              color: Colors.white,
            ),),
            );

            Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text("Click me !"),
      ),
    );
  }
}