import 'package:flutter/material.dart';

class BottomNavExample extends StatelessWidget {

  _bottomNavTap(int index){
    debugPrint("You click $index button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Bottom Nav"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text("Hello Content"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text("Chat"),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            ),
        ],
        onTap: (int index) => _bottomNavTap(index),
        ),
    );
  }
}