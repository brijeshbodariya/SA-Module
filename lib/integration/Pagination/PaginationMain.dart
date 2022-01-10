import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/integration/Pagination/PaginationDesktop.dart';
import 'package:smartkit/integration/Pagination/PaginationMobile.dart';
import 'package:smartkit/integration/Pagination/PaginationTablet.dart';


class PaginationMain extends StatelessWidget {
  const PaginationMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenTypeLayout(
            desktop: PaginationDesktop(),
            mobile: PaginationMobile(),
            tablet: PaginationTablet(),
        )
    );
  }
}
