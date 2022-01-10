import 'package:flutter/material.dart';

class MostpopularGridDesktop extends StatelessWidget {
  const MostpopularGridDesktop({Key key, this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(child: widget);
  }
}

class WomenFashionDesktop extends StatelessWidget {
  const WomenFashionDesktop({Key key, this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(child: widget);
  }
}

class CollectionsGridDektop extends StatelessWidget {
  const CollectionsGridDektop({Key key, this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.width / 3.4, child: widget);
  }
}
