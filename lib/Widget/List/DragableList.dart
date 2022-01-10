import 'package:flutter/material.dart';
import '../List/dragable/draggable_flutter_list.dart';

class DragableList extends StatefulWidget {
  @override
  DragableListState createState() => new DragableListState();
}

class DragableListState extends State<DragableList> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10'
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Draggable List",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: new DragAndDropList(
        items.length,
        itemBuilder: (BuildContext context, index) {
          return new SizedBox(
            child: new Card(
              child: new ListTile(
                title: new Text(items[index]),
              ),
            ),
          );
        },
        onDragFinish: (before, after) {
          String data = items[before];
          items.removeAt(before);
          items.insert(after, data);
        },
        canDrag: (index) {
          return index < items.length; //disable drag for index 3
        },
        canBeDraggedTo: (from, to) {
          return to < items.length;
        },
        dragElevation: 8.0,
      ),
    );
  }
}
