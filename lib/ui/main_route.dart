import 'package:flutter/material.dart';
import 'package:hello_world/model/page.dart';
import 'package:hello_world/ui/assets.dart';
import 'package:hello_world/ui/bill_splitter.dart';
import 'package:hello_world/ui/bizcard.dart';
import 'package:hello_world/ui/bottom_nav.dart';
import 'package:hello_world/ui/floating_action_button.dart';
import 'package:hello_world/ui/gesture_detector.dart';
import 'package:hello_world/ui/home_scaffold.dart';
import 'package:hello_world/ui/movies.dart';
import 'package:hello_world/ui/quotes.dart';

import 'home.dart';

class MainRoute extends StatelessWidget {
  final List<Page> pageList = [
      new Page("Home", "simple homepage", Home()),
      new Page("Home Scaffold", "simple homepage with scaffold implemented", HomeScaffold()),
      new Page("Gesture", "this is gesture detector", GestureDetectorExample()),
      new Page("Floating Action Button", "simple floating action button example", FABExample()),
      new Page("Bottom Nav", "simple bottom navigation", BottomNavExample()),
      new Page("Bizcard", "simple stack card", Bizcard()),
      new Page("Bill Splitter", "simple calculator of bill spliiter", BillSplitter()),
      new Page("Quotes", "simple quotes app", Quotes()),
      new Page("Assets", "use assets in dart", AssetsExample()),
      new Page("Movies", "movies list", Movies()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of basic apps"),
      ),
      backgroundColor: Colors.grey.shade300,
          body: Container(
        padding: EdgeInsets.all(6.0),
        child: ListView.builder(
          itemCount: pageList.length,
          itemBuilder: (context, index){
          return Card(
            color: Colors.white,
            elevation: 3.0,
                      child: ListTile(
              title: Text(pageList[index].title),
              subtitle: Text(pageList[index].subtitle),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => pageList[index].route)),
            ),
          );
        })
      ),
    );
  }
}