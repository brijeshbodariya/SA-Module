import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DonutChartActivity extends StatefulWidget {
  final Widget child;

  DonutChartActivity({Key key, this.child}) : super(key: key);

  DonutChartActivityState createState() => DonutChartActivityState();
}

class DonutChartActivityState extends State<DonutChartActivity> {

  static List<charts.Series<DonutChart, String>> donutChartData() {
    var donutChartdata = [
      new DonutChart('Maths', 35.8, Color(0xff003f5c)),
      new DonutChart('Science', 8.3, Color(0xffbc5090)),
      new DonutChart('Social Science', 10.8, Color(0xff58508d)),
      new DonutChart('English', 15.6, Color(0xffff6361)),
      new DonutChart('Hindi', 19.2, Color(0xffffa600)),
      new DonutChart('Gujarati', 10.3, Color(0xffdc3912)),
    ];

    return [
      new charts.Series<DonutChart, String>(
        domainFn: (DonutChart donutChart, _) => donutChart.year,
        measureFn: (DonutChart donutChart, _) => donutChart.sale,
        colorFn: (DonutChart donutChart, _) =>
            charts.ColorUtil.fromDartColor(donutChart.colorval),
        id: 'Board Result of 2019 All Subject',
        data: donutChartdata,
        labelAccessorFn: (DonutChart donutChart, _) => '${donutChart.sale}',
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
          title: Text('Donut Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                    'Board Result of 2019 All Subject',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25),
                  Expanded(
                    child: charts.PieChart(
                        donutChartData(),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.DatumLegend(position: charts.BehaviorPosition.top,
                            outsideJustification: charts.OutsideJustification.endDrawArea,
                            horizontalFirst: false,
                            desiredMaxRows: 6,
                            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                            entryTextStyle: charts.TextStyleSpec(
                                color: charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11),
                          )
                        ],
                        defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                  labelPosition: charts.ArcLabelPosition.inside)
                            ])),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class DonutChart {
  String year;
  double sale;
  Color colorval;

  DonutChart(this.year, this.sale, this.colorval);
}