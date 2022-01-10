import 'package:flutter/material.dart';
import '../List/Sliver_sticky_header.dart';

class Sticky_Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sticky Header"),
        ),
        body: new Builder(builder: (BuildContext context) {
          return new CustomScrollView(
            slivers: _buildSlivers(context),
          );
        }));
  }

  List<Widget> _buildSlivers(BuildContext context) {
    List<Widget> slivers = [];

    int i = 0;

    slivers.addAll(_buildHeaderBuilderLists(context, i, i += 10));

    return slivers;
  }

  List<Widget> _buildHeaderBuilderLists(BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return new SliverStickyHeaderBuilder(
        builder: (context, state) => _buildAnimatedHeader(context, sliverIndex, state),
        sliver: new SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, i) => new ListTile(
              leading: new CircleAvatar(
                child: new Text('$sliverIndex'),
              ),
              title: new Text('List tile #$i'),
            ),
            childCount: 4,
          ),
        ),
      );
    });
  }

  Widget _buildHeader(int index, {String text}) {
    return new Container(
      height: 60.0,
      color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        text ?? 'Header #$index',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildAnimatedHeader(BuildContext context, int index, SliverStickyHeaderState state) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text('$index'))),
      child: new Container(
        height: 60.0,
        color: (state.isPinned ? Colors.pink : Colors.lightBlue).withOpacity(1.0 - state.scrollPercentage),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: new Text(
          'Header #$index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
