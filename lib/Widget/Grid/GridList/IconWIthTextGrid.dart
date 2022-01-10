import 'package:flutter/material.dart';

class IconWithTextGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> _color = [
      Color(0xFFE25141),
      Color(0xFF4154AF),
      Color(0xFFD0DA58),
      Color(0xFF9036AC),
      Color(0xFF66AC5D),
      Color(0xFFD73A63),
    ];
    // Color(0xFF52B9D2),
    // Color(0xFFF7C245),
    // Color(0xFFEB5F5A),
    // Color(0xFF419387),
    // Color(0xFFF29C37),
    // Color(0xFF735649),

    final iconWithtext = [
      {'icon': Icons.free_breakfast, 'title': "Breakfast"},
      {'icon': Icons.hotel, 'title': "HOtel"},
      {'icon': Icons.local_hospital, 'title': "Hospital"},
      {'icon': Icons.school, 'title': "School"},
      {'icon': Icons.phone, 'title': "Phone"},
      {'icon': Icons.search, 'title': "Hospital"},
      {'icon': Icons.flight, 'title': "Flight"},
      {'icon': Icons.code, 'title': "Code"},
      {'icon': Icons.backup, 'title': "Backup"},
      {'icon': Icons.favorite, 'title': "Favorite"},
      {'icon': Icons.shopping_cart, 'title': "Cart"},
      {'icon': Icons.widgets, 'title': "All"},
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: iconWithtext.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),

        itemBuilder: (BuildContext context, int index) {
          // print("--/--" + iconWithtext[index]['title']);
          String titlecus = iconWithtext[index]['title'];
          Color bg = _color[index % _color.length];
          return Container(
            child: Column(
              children: [
                Icon(
                  iconWithtext[index]['icon'],
                  color: bg,
                ),
                Text(
                  titlecus,
                  style: TextStyle(color: bg),
                )
              ],
            ),
          );
        },

        // children: List.generate(36, (index) {
        //   Color bg = _color[index % _color.length];
        //   var no = index + 1;
        //   return new Container(
        //     decoration: BoxDecoration(
        //         color: bg, borderRadius: BorderRadius.circular(10.0)),
        //     margin: new EdgeInsets.all(6.0),
        //     child: new Column(
        //       children: [

        //       ],
        //     ),
        //   );
        // }),
      ),
    );
  }
}
