import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ComboChartActivity extends StatefulWidget {
  final Widget child;

  ComboChartActivity({Key key, this.child}) : super(key: key);

  ComboChartActivityState createState() => ComboChartActivityState();
}

class ComboChartActivityState extends State<ComboChartActivity> {

  static List<charts.Series<ComboChart, String>> comboChartData() {
    final iPhoneSalesData = [
      new ComboChart('2018', 5),
      new ComboChart('2019', 25),
      new ComboChart('2020', 100),
      new ComboChart('2021', 75),
    ];

    final samsungSalesData = [
      new ComboChart('2018', 5),
      new ComboChart('2019', 25),
      new ComboChart('2020', 100),
      new ComboChart('2021', 75),
    ];

    final miSalesData = [
      new ComboChart('2018', 10),
      new ComboChart('2019', 50),
      new ComboChart('2020', 200),
      new ComboChart('2021', 150),
    ];

    return [
      new charts.Series<ComboChart, String>(
          id: 'iPhone',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff003f5c)),
          domainFn: (ComboChart comboChart, _) => comboChart.year,
          measureFn: (ComboChart comboChart, _) => comboChart.sale,
          data: iPhoneSalesData),
      new charts.Series<ComboChart, String>(
          id: 'Samsung',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xffbc5090)),
          domainFn: (ComboChart comboChart, _) => comboChart.year,
          measureFn: (ComboChart comboChart, _) => comboChart.sale,
          data: samsungSalesData),
      new charts.Series<ComboChart, String>(
          id: 'LineSeries ',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff58508d)),
          domainFn: (ComboChart comboChart, _) => comboChart.year,
          measureFn: (ComboChart comboChart, _) => comboChart.sale,
          data: miSalesData)
        ..setAttribute(charts.rendererIdKey, 'LineSeries'),
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
          title: Text('Combo Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                    'Mobile Sale Company in Last 4 Year',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: charts.OrdinalComboChart(comboChartData(),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        defaultRenderer: new charts.BarRendererConfig(
                            groupingType: charts.BarGroupingType.grouped),
                        customSeriesRenderers: [
                          new charts.LineRendererConfig(
                              customRendererId: 'LineSeries')
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

class ComboChart {
  final String year;
  final int sale;

  ComboChart(this.year, this.sale);
}