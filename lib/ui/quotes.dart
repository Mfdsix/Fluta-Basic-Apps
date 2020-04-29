import 'package:flutter/material.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  int _index = -1;
  List quotes = [
    "Live as if you were to die tomorrow. Learn as if you were to live forever.",
    "That which does not kill us makes us stronger.",
    "Be who you are and say what you feel, because those who mind don’t matter and those who matter don’t mind.",
    "We must not allow other people’s limited perceptions to define us.",
    "Do what you can, with what you have, where you are.",
    "Be yourself; everyone else is already taken.",
    "This above all: to thine own self be true.",
    "If you cannot do great things, do small things in a great way.",
    "If opportunity doesn’t knock, build a door.",
    "Wise men speak because they have something to say; fools because they have to say something."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Today Quotes")),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    quotes[_index % quotes.length],
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 3.0,
              color: Colors.grey.shade300,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: FlatButton.icon(
                onPressed: () => _getQuote(),
                color: Colors.blue,
                icon: Icon(Icons.wb_sunny),
                label: Text(
                  "Inspire me!",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _getQuote() {
    setState(() {
      _index++;
    });
  }
}
