import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChartActivity extends StatefulWidget {
  final Widget child;

  PieChartActivity({Key key, this.child}) : super(key: key);

  PieChartActivityState createState() => PieChartActivityState();
}

class PieChartActivityState extends State<PieChartActivity> {

  static List<charts.Series<PieChart, String>> pieChartData() {
    var pieChartdata = [
      new PieChart('2016', 35.8, Color(0xff003f5c)),
      new PieChart('2017', 8.3, Color(0xffbc5090)),
      new PieChart('2018', 10.8, Color(0xff58508d)),
      new PieChart('2019', 15.6, Color(0xffff6361)),
      new PieChart('2020', 19.2, Color(0xffffa600)),
      new PieChart('2021', 10.3, Color(0xffdc3912)),
    ];

    return [
      new charts.Series<PieChart, String>(
        domainFn: (PieChart pieChart, _) => pieChart.year,
        measureFn: (PieChart pieChart, _) => pieChart.persent,
        colorFn: (PieChart pieChart, _) =>
            charts.ColorUtil.fromDartColor(pieChart.colorval),
        id: 'Employment in Last 5 Years',
        data: pieChartdata,
        labelAccessorFn: (PieChart pieChart, _) => '${pieChart.persent}',
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
          title: Text('Pie Chart',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
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
                    'Employment in Last 5 Years',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 25,),
                  Expanded(
                    child: charts.PieChart(
                        pieChartData(),
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
                          //arcWidth: 100,
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

class PieChart {
  String year;
  double persent;
  Color colorval;

  PieChart(this.year, this.persent, this.colorval);
}