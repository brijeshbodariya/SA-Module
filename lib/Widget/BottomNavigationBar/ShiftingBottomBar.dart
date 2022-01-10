import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class ShiftingBottomBar extends StatefulWidget {
  const ShiftingBottomBar({
    Key key,
  });

  @override
  _ShiftingBottomBarState createState() => _ShiftingBottomBarState();
}

class _ShiftingBottomBarState extends State<ShiftingBottomBar> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: happyshopcolor2,
      elevation: 1.0,
      selectedItemColor: eStudy2,
      unselectedItemColor: happyshopcolor2,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
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
