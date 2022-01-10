import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarGraphActivity extends StatefulWidget {
  final Widget child;

  BarGraphActivity({Key key, this.child}) : super(key: key);

  BarGraphActivityState createState() => BarGraphActivityState();
}

class BarGraphActivityState extends State<BarGraphActivity> {

  static List<charts.Series<BarChart, String>> barChartData() {
    final barChartData = [
      new BarChart('2018', 5),
      new BarChart('2019', 25),
      new BarChart('2020', 100),
      new BarChart('2021', 75),
    ];

    return [
      new charts.Series<BarChart, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff003f5c)),
        domainFn: (BarChart barChart, _) => barChart.year,
        measureFn: (BarChart barChart, _) => barChart.sale,
        data: barChartData,
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
            title: Text('Bar Graph',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                            'Mobile Sale in Last 4 Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                          SizedBox(height: 25),
                          Expanded(
                            child: charts.BarChart(
                              barChartData(),
                              animate: true,
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


class BarChart {
  final String year;
  final int sale;

  BarChart(this.year, this.sale);
}