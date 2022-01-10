import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class IconBottomBar extends StatefulWidget {
  const IconBottomBar({
    Key key,
  });

  @override
  _IconBottomBarState createState() => _IconBottomBarState();
}

class _IconBottomBarState extends State<IconBottomBar> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: smartkey2,
      elevation: 1.0,
      // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: new Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: new Icon(Icons.mail),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.search),
        )
      ],
    );
  }
}
