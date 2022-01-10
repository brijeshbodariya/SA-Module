import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';

class Single_Choice extends StatefulWidget {
  @override
  _Single_ChoiceState createState() => new _Single_ChoiceState();
}

class _Single_ChoiceState extends State<Single_Choice> {
  List<String> countries = <String>['Belgium', 'France', 'Italy', 'Germany', 'Spain', 'Portugal'];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Please select'),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
                //  Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
            new TextButton(
              child: new Text("Accept"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: new SingleChildScrollView(
            child: new Material(
              color: Colors.white,
              child: new MyDialogContent(countries: countries),
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Single Choice",
          )),
    );
  }
}

class MyDialogContent extends StatefulWidget {
  MyDialogContent({
    Key key,
    this.countries,
  }) : super(key: key);

  final List<String> countries;

  @override
  _MyDialogContentState createState() => new _MyDialogContentState();
}

class _MyDialogContentState extends State<MyDialogContent> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  _getContent() {
    if (widget.countries.length == 0) {
      return new Container();
    }

    return new Column(
        children: new List<RadioListTile<int>>.generate(widget.countries.length, (int index) {
      return new RadioListTile<int>(
        value: index,
        groupValue: _selectedIndex,
        title: new Text(widget.countries[index]),
        onChanged: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}
