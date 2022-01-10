import 'package:flutter/material.dart';

class SimpalBottomBar extends StatefulWidget {
  const SimpalBottomBar({
    Key key,
  });

  @override
  _SimpalBottomBarState createState() => _SimpalBottomBarState();
}

class _SimpalBottomBarState extends State<SimpalBottomBar> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      elevation: 1.0,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          label: 'Messages',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],
    );
  }
}
