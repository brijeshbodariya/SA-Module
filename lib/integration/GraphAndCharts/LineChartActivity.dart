import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChartActivity extends StatefulWidget {
  final Widget child;

  LineChartActivity({Key key, this.child}) : super(key: key);

  LineChartActivityState createState() => LineChartActivityState();
}

class LineChartActivityState extends State<LineChartActivity> {

  static List<charts.Series<LineChart, int>> lineChartData() {
    var lineChartData1 = [
      new LineChart(0, 45),
      new LineChart(1, 56),
      new LineChart(2, 55),
      new LineChart(3, 60),
      new LineChart(4, 61),
      new LineChart(5, 70),
    ];
    var lineChartData2 = [
      new LineChart(0, 35),
      new LineChart(1, 46),
      new LineChart(2, 45),
      new LineChart(3, 50),
      new LineChart(4, 51),
      new LineChart(5, 60),
    ];

    var lineChartData3 = [
      new LineChart(0, 20),
      new LineChart(1, 24),
      new LineChart(2, 25),
      new LineChart(3, 40),
      new LineChart(4, 45),
      new LineChart(5, 60),
    ];

    return [
      new charts.Series<LineChart, int>(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff003f5c)),
        id: 'Amazon',
        data: lineChartData1,
        domainFn: (LineChart lineChart, _) => lineChart.year,
        measureFn: (LineChart lineChart, _) => lineChart.sale,
      ),
      new charts.Series<LineChart, int>(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffbc5090)),
        id: 'Flipkart',
        data: lineChartData2,
        domainFn: (LineChart lineChart, _) => lineChart.year,
        measureFn: (LineChart lineChart, _) => lineChart.sale,
      ),
      new charts.Series<LineChart, int>(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff58508d)),
        id: 'Snapdeal',
        data: lineChartData3,
        domainFn: (LineChart lineChart, _) => lineChart.year,
        measureFn: (LineChart lineChart, _) => lineChart.sale,
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
          title: Text('Line Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                    'E-commerce Selling Product in Last 5 years',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 25),
                  Expanded(
                    child: charts.LineChart(
                        lineChartData(),
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: true),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.ChartTitle('Years',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Sales',
                              behaviorPosition: charts.BehaviorPosition.start,
                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('E-commerce Company',
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                          )
                        ]
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

class LineChart {
  int year;
  int sale;

  LineChart(this.year, this.sale);
}