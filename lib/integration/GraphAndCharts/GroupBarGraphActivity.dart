import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupBarGraphActivity extends StatefulWidget {
  final Widget child;

  GroupBarGraphActivity({Key key, this.child}) : super(key: key);

  GroupBarGraphActivityState createState() => GroupBarGraphActivityState();
}

class GroupBarGraphActivityState extends State<GroupBarGraphActivity> {

  static List<charts.Series<GroupBarChart, String>> groupBarChartData() {
    var groupBarChartData1 = [
      new GroupBarChart(2019, 'iPhone', 30),
      new GroupBarChart(2020, 'Samsung', 40),
      new GroupBarChart(2021, 'MI', 10),
    ];
    var groupBarChartData2 = [
      new GroupBarChart(2019, 'iPhone', 100),
      new GroupBarChart(2020, 'Samsung', 150),
      new GroupBarChart(2021, 'MI', 80),
    ];
    var groupBarChartData3 = [
      new GroupBarChart(2019, 'iPhone', 200),
      new GroupBarChart(2020, 'Samsung', 300),
      new GroupBarChart(2021, 'MI', 180),
    ];

    return [
      new charts.Series<GroupBarChart, String>(
        domainFn: (GroupBarChart groupBarChart, _) => groupBarChart.mobile,
        measureFn: (GroupBarChart groupBarChart, _) => groupBarChart.quantity,
        id: '2019',
        data: groupBarChartData1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (GroupBarChart groupBarChart, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff003f5c)),
      ),
      new charts.Series<GroupBarChart, String>(
        domainFn: (GroupBarChart groupBarChart, _) => groupBarChart.mobile,
        measureFn: (GroupBarChart groupBarChart, _) => groupBarChart.quantity,
        id: '2020',
        data: groupBarChartData2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (GroupBarChart groupBarChart, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffbc5090)),
      ),
      new charts.Series<GroupBarChart, String>(
        domainFn: (GroupBarChart groupBarChart, _) => groupBarChart.mobile,
        measureFn: (GroupBarChart groupBarChart, _) => groupBarChart.quantity,
        id: '2021',
        data: groupBarChartData3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (GroupBarChart groupBarChart, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff58508d)),
      ),
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
          title: Text('Group Bar Graph',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                    'Mobile Sale Company in Last 3 Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: charts.BarChart(
                      groupBarChartData(),
                      animate: true,
                      barGroupingType: charts.BarGroupingType.grouped,
                      animationDuration: Duration(seconds: 5),
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

class GroupBarChart {
  String mobile;
  int year;
  int quantity;

  GroupBarChart(this.year, this.mobile, this.quantity);
}