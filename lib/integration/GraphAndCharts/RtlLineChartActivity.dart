import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RtlLineChartActivity extends StatefulWidget {
  final Widget child;

  RtlLineChartActivity({Key key, this.child}) : super(key: key);

  RtlLineChartActivityState createState() => RtlLineChartActivityState();
}

class RtlLineChartActivityState extends State<RtlLineChartActivity> {

  static List<charts.Series<RtlLineChart, int>> rtlLineChartData() {
    final data = [
      new RtlLineChart(0, 5),
      new RtlLineChart(1, 25),
      new RtlLineChart(2, 100),
      new RtlLineChart(3, 75),
    ];

    return [
      new charts.Series<RtlLineChart, int>(
        id: 'Amazon Sale in Last 4 Year',
        domainFn: (RtlLineChart rtlLineChart, _) => rtlLineChart.year,
        measureFn: (RtlLineChart rtlLineChart, _) => rtlLineChart.sale,
        data: data,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff58508d)),
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
          title: Text('Rtl Line Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    'Amazon Sale in Last 4 Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: new charts.LineChart(
                          rtlLineChartData(),
                          animate: true,
                          animationDuration: Duration(seconds: 5),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class RtlLineChart {
  final int year;
  final int sale;

  RtlLineChart(this.year, this.sale);
}