import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScatterPlotChartActivity extends StatefulWidget {
  final Widget child;

  ScatterPlotChartActivity({Key key, this.child}) : super(key: key);

  ScatterPlotChartActivityState createState() => ScatterPlotChartActivityState();
}

class ScatterPlotChartActivityState extends State<ScatterPlotChartActivity> {

  static List<charts.Series<ScattorPlotChart, int>> scattorPlotChartData() {
    final scattorPlotChartData = [
      new ScattorPlotChart(1, 5, 3.0),
      new ScattorPlotChart(2, 25, 5.0),
      new ScattorPlotChart(3, 75, 4.0),
      new ScattorPlotChart(4, 225, 5.0),
      new ScattorPlotChart(5, 50, 4.0),
      new ScattorPlotChart(6, 75, 3.0),
      new ScattorPlotChart(7, 100, 3.0),
      new ScattorPlotChart(8, 150, 5.0),
      new ScattorPlotChart(9, 10, 4.5),
      new ScattorPlotChart(10, 300, 8.0),
      new ScattorPlotChart(11, 15, 4.0),
      new ScattorPlotChart(12, 200, 7.0),
    ];

    final maxMeasure = 300;

    return [
      new charts.Series<ScattorPlotChart, int>(
        id: 'Online Course Selling in Last Year',
        colorFn: (ScattorPlotChart sales, _) {
          final bucket = sales.sale / maxMeasure;

          if (bucket < 1 / 3) {
            return charts.ColorUtil.fromDartColor(Color(0xff003f5c));
          } else if (bucket < 2 / 3) {
            return charts.ColorUtil.fromDartColor(Color(0xffbc5090));
          } else {
            return charts.ColorUtil.fromDartColor(Color(0xff58508d));
          }
        },
        domainFn: (ScattorPlotChart scattorPlotChart, _) => scattorPlotChart.month,
        measureFn: (ScattorPlotChart scattorPlotChart, _) => scattorPlotChart.sale,
        radiusPxFn: (ScattorPlotChart scattorPlotChart, _) => scattorPlotChart.radius,
        data: scattorPlotChartData,
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
          title: Text('Scatter Plot Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body:   Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    'Online Course Selling in Last Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: charts.ScatterPlotChart(scattorPlotChartData(),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        defaultRenderer: new charts.PointRendererConfig(),
                        customSeriesRenderers: [
                          new charts.LineRendererConfig(
                              customRendererId: 'customLine',
                              layoutPaintOrder: charts.LayoutViewPaintOrder.point + 1)
                        ]),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

class ScattorPlotChart {
  final int month;
  final int sale;
  final double radius;

  ScattorPlotChart(this.month, this.sale, this.radius);
}