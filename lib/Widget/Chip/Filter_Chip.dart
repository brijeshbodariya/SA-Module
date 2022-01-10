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

class Filter_Chip extends StatefulWidget {
  @override
  _Filter_ChipState createState() => _Filter_ChipState();
}

class _Filter_ChipState extends State<Filter_Chip> {
  final Set<String> _list = <String>{};
  final Set<String> _selectedFilter = <String>{};

  _Filter_ChipState() {
    _list.clear();
    _list.addAll(_defaultListItem);
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> filterChips = _defaultListItem.map<Widget>((String name) {
      return FilterChip(
        key: ValueKey<String>(name),
        label: Text(name),
        selected: _list.contains(name) ? _selectedFilter.contains(name) : false,
        onSelected: !_list.contains(name)
            ? null
            : (bool value) {
          setState(() {
            if (!value) {
              _selectedFilter.remove(name);
            } else {
              _selectedFilter.add(name);
            }
          });
        },
      );
    }).toList();


    return Scaffold(
        appBar: AppBar(title: Text("Filter Chip",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body:

        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              new Text("Select Language",style: TextStyle(fontSize: 20),),
              new SizedBox(width: 20,height: 20,),
              new Wrap(
                  children: filterChips.map<Widget>((Widget chip) {
                    return Padding(

                      padding: const EdgeInsets.all(2.0),
                      child: chip,
                    );
                  }).toList()),
            ],
          ),
        ));
    // body:_ackAlert ,
  }
}
