import 'package:flutter/material.dart';

import 'AnchoredOverlay.dart';
import 'Fab_with_icons.dart';
import 'fab_bottom_app_bar.dart';

class FabCenter_BottomNav extends StatefulWidget {
  @override
  _FabCenter_BottomNavState createState() => new _FabCenter_BottomNavState();
}

class _FabCenter_BottomNavState extends State<FabCenter_BottomNav> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("FAB Center"),
      // ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Buy',
        color: Colors.grey,
        selectedColor: Colors.pink,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.star, text: 'Rate'),
          FABBottomAppBarItem(iconData: Icons.group, text: 'Invite'),
          FABBottomAppBarItem(iconData: Icons.favorite, text: 'Favorite'),
          FABBottomAppBarItem(iconData: Icons.bookmark, text: 'Bookmark'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Cart',
        child: Icon(Icons.shopping_cart),
        elevation: 2.0,
      ),
    );
  }
}
