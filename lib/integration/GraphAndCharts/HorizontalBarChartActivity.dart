import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HorizontalBarChartActivity extends StatefulWidget {
  final Widget child;

  HorizontalBarChartActivity({Key key, this.child}) : super(key: key);

  HorizontalBarChartActivityState createState() => HorizontalBarChartActivityState();
}

class HorizontalBarChartActivityState extends State<HorizontalBarChartActivity> {

  static List<charts.Series<HorizontalBarGraph, String>> horizontalBarGraphData() {
    final horizontalBarGraphData = [
      new HorizontalBarGraph('2018', 5),
      new HorizontalBarGraph('2019', 25),
      new HorizontalBarGraph('2020', 100),
      new HorizontalBarGraph('2021', 75),
    ];

    return [
      new charts.Series<HorizontalBarGraph, String>(
        id: 'Population in Last 4 Year',
        domainFn: (HorizontalBarGraph horizontalBarGraph, _) => horizontalBarGraph.year,
        measureFn: (HorizontalBarGraph horizontalBarGraph, _) => horizontalBarGraph.population,
        data: horizontalBarGraphData,
        fillColorFn: (HorizontalBarGraph horizontalBarGraph, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff58508d)),
      )
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horizontal Bar Graph',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    'Population in Last 4 Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: new charts.BarChart(
                      horizontalBarGraphData(),
                      animate: true,
                      animationDuration: Duration(seconds: 5),
                      vertical: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class HorizontalBarGraph {
  final String year;
  final int population;

  HorizontalBarGraph(this.year, this.population);
}