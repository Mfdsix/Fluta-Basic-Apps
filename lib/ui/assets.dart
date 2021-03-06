import 'package:flutter/material.dart';
import 'package:hello_world/model/question.dart';

class AssetsExample extends StatefulWidget {
  @override
  _AssetsExampleState createState() => _AssetsExampleState();
}

class _AssetsExampleState extends State<AssetsExample> {
  List questions = [
    Question.name("A RIVER is bigger than a STREAM.", true),
    Question.name("There are one thousand years in a CENTURY.", false),
    Question.name("FOUNDED is the past tense of FOUND.", false),
    Question.name("ANSWER can be used as a noun and a verb.", true),
    Question.name("SCARLET is a brilliant red colour.", true),
    Question.name("USED TO DOING and USED TO DO mean the same thing.", false),
    Question.name("You can use IMPROVE as a noun and as a verb.", false),
    Question.name("DOZEN is equivalent to 20.", true),
    Question.name("The past tense of FIND is FOUND.", false),
    Question.name(
        " EQUIVALENT TO is (more or less) the same as EQUAL TO.", true),
  ];
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("True or False"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "images/flag.png",
                    width: 260,
                    height: 180,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 120.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500, width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    questions[_position].questionText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: ()=> _previousQuestion(),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                        color: Colors.blueGrey.shade700,
                      ),
                      RaisedButton(
                        onPressed:()=> _giveAnswer(true, context),
                        child: Text("True"),
                        color: Colors.blueGrey.shade700,
                        textColor: Colors.white,
                      ),
                      RaisedButton(
                        onPressed: ()=>_giveAnswer(false, context),
                        child: Text("False"),
                        color: Colors.blueGrey.shade700,
                        textColor: Colors.white,
                      ),
                      RaisedButton(
                        onPressed:()=> _nextQuestion(),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                        color: Colors.blueGrey.shade700,
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }

  _giveAnswer(bool answer, BuildContext context) {
    if (answer == questions[_position].isCorrect) {
      final snackbar = SnackBar(
        content: Text("You are correct!"),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuestion();
    } else {
      final snackbar = SnackBar(
        content: Text("Oops, you are wrong !"),
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  _nextQuestion() {
    setState(() {
      _position = (_position + 1) % questions.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _position = (_position == 0) ? 0 : _position-1;
    });
  }
}
