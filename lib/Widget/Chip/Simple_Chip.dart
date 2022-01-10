import 'package:flutter/material.dart';

const List<String> _defaultListItem = <String>[
  'Chinese',
  'Spanish',
  'English',
  'Hindi',
  'Arabic',
  'Portuguese',
  'Bengali',
  'Russian',
  'German',
  'Korean',
  'French',
  'Telugu',
  'Marathi',
  'Tamil',
  'Urdu',
  'Gujarati',
  'Malayalam',
  'Odia',
  'Punjabi',
  'Maithili',
];

class Simple_Chip extends StatefulWidget {
  @override
  _Simple_ChipState createState() => _Simple_ChipState();
}

class _Simple_ChipState extends State<Simple_Chip> {
  final Set<String> _list = <String>{};
  String _selectedChip = '';

  _Simple_ChipState() {
    _list.clear();
    _list.addAll(_defaultListItem);
  }

  Color _getColor(String name) {
    assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  void _removeMaterial(String name) {
    _list.remove(name);
    if (_selectedChip == name) {
      _selectedChip = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = _list.map<Widget>((String name) {
      return Chip(
        key: ValueKey<String>(name),
        backgroundColor: _getColor(name),
        label: Text((name)),
        onDeleted: () {
          setState(() {
            _removeMaterial(name);
          });
        },
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text("Simple Chip",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Center(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  "Select Your Language",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                new SizedBox(
                  width: 20,
                  height: 20,
                ),
                new Wrap(
                    children: chips.map<Widget>((Widget chip) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: chip,
                  );
                }).toList()),
              ],
            ),
          ),
        ));
    // body:_ackAlert ,
  }
}
