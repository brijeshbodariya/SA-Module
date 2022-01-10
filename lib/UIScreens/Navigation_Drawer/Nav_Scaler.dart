import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';
import '../Navigation_Drawer/Drawer_Scaffold.dart';
import '../Navigation_Drawer/menu_screen.dart';

class DrawerScaleIcon extends StatefulWidget {
  @override
  _DrawerScaleIconState createState() => _DrawerScaleIconState();
}

class _DrawerScaleIconState extends State<DrawerScaleIcon> {
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'THE PADDOCK',
        icon: Icons.restaurant,
      ),
      new MenuItem(
        id: 'profile',
        title: 'PROFILE',
        icon: Icons.person,
      ),
      new MenuItem(
        id: 'help',
        title: 'HELP',
        icon: Icons.help,
      ),
      new MenuItem(
        id: 'setting',
        title: 'SETTINGS',
        icon: Icons.settings,
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var _widget = Text("The Paddock");

  @override
  Widget build(BuildContext context) {
    return new DrawerScaffold(
        percentage: 0.6,
        appBar: AppBarProps(title: Text("Drawer - Scale with Icon"), actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
        menuView: new MenuView(
          menu: menu,
          animation: true,
          selectorColor: happyshopcolor2,
          // color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (String itemId) {
            selectedMenuItemId = itemId;
            if (itemId == 'restaurant') {
              setState(() => _widget = Text("The Paddock"));
            } else if (itemId == 'profile') {
              setState(() => _widget = Text("Profile"));
            } else if (itemId == 'help') {
              setState(() => _widget = Text("Help"));
            } else {
              setState(() => _widget = Text("Setting"));
            }
          },
        ),
        contentView: Screen(
          contentBuilder: (context) => LayoutBuilder(
            builder: (context, constraint) => GestureDetector(
              child: Container(
                color: Colors.white,
                width: constraint.maxWidth,
                height: constraint.maxHeight,
                child: Center(child: _widget),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Clicked"),
                  duration: Duration(seconds: 3),
                ));
              },
            ),
          ),
          color: Colors.white,
        ));
  }
}
