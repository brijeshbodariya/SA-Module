import 'package:flutter/material.dart';
import '../List/Slidable.dart';
import '../List/Slide_action.dart';

class Swipe_Delete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Swipe Delete",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleWidgets();
  }
}

class CircleWidgets extends State<SwipeList> {
  final List<_HomeItem> items = List.generate(
    20,
    (i) => new _HomeItem(
      i,
      'Tile $i',
      "sub",
      Colors.blue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new OrientationBuilder(
        builder: (context, orientation) => _buildList(context, orientation == Orientation.portrait ? Axis.vertical : Axis.horizontal),
      ),
    );
  }

  static List getDummyList() {
    List list = List.generate(15, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }

  Widget _buildList(BuildContext context, Axis direction) {
    return new ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        final Axis slidableDirection = direction == Axis.horizontal ? Axis.vertical : Axis.horizontal;
        return _getSlidableWithLists(context, index, slidableDirection);
      },
      itemCount: items.length,
    );
  }

  Widget _getSlidableWithLists(BuildContext context, int index, Axis direction) {
    final _HomeItem item = items[index];
    //final int t = index;
    return new Slidable(
      key: new Key(item.title),
      direction: direction,
      slideToDismissDelegate: new SlideToDismissDrawerDelegate(
        onDismissed: (actionType) {
          _showSnackBar(context, actionType == SlideActionType.primary ? 'Dismiss Archive' : 'Dimiss Delete');
          setState(() {
            items.removeAt(index);
          });
        },
      ),
      delegate: new SlidableBehindDelegate(),
      actionExtentRatio: 0.25,
      child: direction == Axis.horizontal ? _buildVerticalListItem(context, index) : _buildhorizontalListItem(context, index),
      actions: <Widget>[
        new IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _showSnackBar(context, 'Archive'),
        ),
        new IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _showSnackBar(context, 'Share'),
        ),
      ],
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'More',
          color: Colors.grey.shade200,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar(context, 'More'),
          closeOnTap: false,
        ),
        new IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar(context, 'Delete'),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }

  Widget _buildVerticalListItem(BuildContext context, int index) {
    final _HomeItem item = items[index];
    return new Container(
      color: Colors.white,
      child: new ListTile(
        leading: new CircleAvatar(
          backgroundColor: item.color,
          child: new Text('${item.index}'),
          foregroundColor: Colors.white,
        ),
        title: new Text(item.title),
        subtitle: new Text(item.subtitle),
      ),
    );
  }

  Widget _buildhorizontalListItem(BuildContext context, int index) {
    final _HomeItem item = items[index];
    return new Container(
      color: Colors.white,
      width: 160.0,
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Expanded(
            child: new CircleAvatar(
              backgroundColor: item.color,
              child: new Text('${item.index}'),
              foregroundColor: Colors.white,
            ),
          ),
          new Expanded(
            child: Center(
              child: new Text(
                item.subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeItem {
  const _HomeItem(
    this.index,
    this.title,
    this.subtitle,
    this.color,
  );

  final int index;
  final String title;
  final String subtitle;
  final Color color;
}
