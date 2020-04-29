import 'package:flutter/material.dart';
import 'package:hello_world/ui/gesture_detector.dart';

class HomeScaffold extends StatelessWidget {

  _tapButton(){
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email),onPressed: ()=> debugPrint("Email tapped")),
          IconButton(icon: Icon(Icons.access_alarms), onPressed: () => _tapButton()),
        ],
      ),
      backgroundColor: Colors.redAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Text(
                "Click me!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () => debugPrint("Tapped ...."),
              ),
          ],
        ),
      )
    );
  }
}