import 'package:flutter/material.dart';

class List_Sectioned extends StatelessWidget {
  final List<ListItem> items = List<ListItem>.generate(
    100,
    (i) => i % 6 == 0
        ? HeadingItem("Heading $i")
        : MessageItem("Title $i", "Sub Title $i"),
  );

  @override
  Widget build(BuildContext context) {
    final title = 'Sectioned List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title,style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens! We'll
          // convert each item into a Widget based on the type of item it is.
          // ignore: missing_return
          itemBuilder: (context, index) {
            final item = items[index];

            if (item is HeadingItem) {
              return Container(
                margin: EdgeInsets.all(10),
                color: Colors.blue,
                child: ListTile(
                  title: Text(
                    item.heading,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .merge(TextStyle(color: Colors.white)),
                  ),
                ),
              );
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
          },
        ),
      ),
    );
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
