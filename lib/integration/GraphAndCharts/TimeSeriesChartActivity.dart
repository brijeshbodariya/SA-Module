import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesChartActivity extends StatefulWidget {
  final Widget child;

  TimeSeriesChartActivity({Key key, this.child}) : super(key: key);

  TimeSeriesChartActivityState createState() => TimeSeriesChartActivityState();
}

class TimeSeriesChartActivityState extends State<TimeSeriesChartActivity> {

  static List<charts.Series<TimeSeriesChart, DateTime>> timeSeriesChartData() {
    final data = [
      new TimeSeriesChart(new DateTime(2018, 9, 19), 5),
      new TimeSeriesChart(new DateTime(2019, 9, 26), 25),
      new TimeSeriesChart(new DateTime(2020, 10, 3), 100),
      new TimeSeriesChart(new DateTime(2021, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesChart, DateTime>(
        id: 'Air Pollution in Last 4 Year',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xffbc5090)),
        domainFn: (TimeSeriesChart timeSeriesChart, _) => timeSeriesChart.time,
        measureFn: (TimeSeriesChart timeSeriesChart, _) => timeSeriesChart.pollution,
        data: data,
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
          title: Text('Time Series Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                    'Air Pollution in Last 4 Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: charts.TimeSeriesChart(
                      timeSeriesChartData(),
                      animate: true,
                      animationDuration: Duration(seconds: 5),
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
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

class TimeSeriesChart {
  final DateTime time;
  final int pollution;

  TimeSeriesChart(this.time, this.pollution);
}