import 'package:flutter/material.dart';

const List<String> _defaultListItem = <String>[
  'Small',
  'Medium',
  'Large',
  'XLarge',
  'XXLarge',
];


const List<String> _sortItem = <String>[
  'Popular',
  'Recent',
  'Lower Price',
  'Higher Price',
  'Nearest',
  'Branded'
];

class Choice_Chip extends StatefulWidget {
  @override
  _Choice_ChipState createState() => _Choice_ChipState();
}

class _Choice_ChipState extends State<Choice_Chip> {
  final Set<String> _list = <String>{};
  final Set<String> _sortlist = <String>{};
  String _selectedChoice = '',_selectedSortby='';

  _Choice_ChipState() {
    _list.clear();
    _list.addAll(_defaultListItem);
    _sortlist.clear();
    _sortlist.addAll(_sortItem);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> choiceChips = _list.map<Widget>((String name) {
      return ChoiceChip(
        key: ValueKey<String>(name),
        backgroundColor: Colors.blue,
        label: Text((name)),
        selected: _selectedChoice == name,
        onSelected: (bool value) {
          setState(() {
            _selectedChoice = value ? name : '';
          });
        },
      );
    }).toList();

    final List<Widget> sortbyChips = _sortlist.map<Widget>((String name) {
      return ChoiceChip(
        key: ValueKey<String>(name),
        backgroundColor: Colors.blue,
        label: Text((name)),
        selected: _selectedSortby == name,
        onSelected: (bool value) {
          setState(() {
            _selectedSortby = value ? name : '';
          });
        },
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text("Choice Chip")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Select your size"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: new Wrap(
                      children: choiceChips.map<Widget>((Widget chip) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: chip,
                    );
                  }).toList(),
                  ),
                ),
              ),
              new Text("Filter By"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: new Wrap(
                    children: sortbyChips.map<Widget>((Widget chip) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: chip,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
    // body:_ackAlert ,
  }
}
