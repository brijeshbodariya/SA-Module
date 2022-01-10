import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class TitleBottomBar extends StatefulWidget {
  const TitleBottomBar({
    Key key,
  });

  @override
  _TitleBottomBarState createState() => _TitleBottomBarState();
}

class _TitleBottomBarState extends State<TitleBottomBar> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TitledBottomNavigationBar(reverse: true, curve: Curves.easeInBack, enableShadow: false, activeColor: Colors.red, inactiveColor: Colors.blueGrey, onTap: (index) => {_currentIndex}, items: [
      TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
      TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
      TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
      TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
      TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
    ]);
  }
}
