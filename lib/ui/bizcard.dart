import 'package:flutter/material.dart';

class Bizcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bizcard")),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(14.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Maputh Ainur",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Zgenit Official",
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.call),
              Text("08580268281"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.mail_outline),
              Text("mfdsix.1nd0@gmail.com"),
            ],
          ),
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(40.0),
        border: Border.all(color: Colors.lightBlue, width: 2.0),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/80"),),
      ),
    );
  }
}
