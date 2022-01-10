import 'package:flutter/material.dart';

class ColumnGrid4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> _color = [
      Color(0xFFE25141),
      Color(0xFF4154AF),
      Color(0xFFD0DA58),
      Color(0xFF9036AC),
      Color(0xFF66AC5D),
      Color(0xFFD73A63),
      Color(0xFF52B9D2),
      Color(0xFFF7C245),
      Color(0xFFEB5F5A),
      Color(0xFF419387),
      Color(0xFFF29C37),
      Color(0xFF735649),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 4,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(36, (index) {
          Color bg = _color[index % _color.length];
          var no = index + 1;
          return new Container(
              decoration: BoxDecoration(
                  color: bg, borderRadius: BorderRadius.circular(10.0)),
              margin: new EdgeInsets.all(6.0),
              child: new Center(
                child: new Text('Item $no',
                    style: Theme.of(context).textTheme.headline6),
              ));
        }),
      ),
    );
  }
}
