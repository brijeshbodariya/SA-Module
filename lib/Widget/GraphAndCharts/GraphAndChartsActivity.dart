// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// void main() => runApp(HomePage());
// class HomePage extends StatefulWidget {
//   final Widget child;

//   HomePage({Key key, this.child}) : super(key: key);

//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<charts.Series<BarChart, String>> _seriesData;
//   List<charts.Series<PieChart, String>> _seriesPieData;
//   List<charts.Series<Sales, int>> _seriesLineData;
//   List<charts.Series> seriesList;
//   bool animate;

//   _generateData() {
//     var data1 = [
//       new BarChart(2019, 'iPhone', 30),
//       new BarChart(2020, 'Samsung', 40),
//       new BarChart(2021, 'MI', 10),
//     ];
//     var data2 = [
//       new BarChart(2019, 'iPhone', 100),
//       new BarChart(2020, 'Samsung', 150),
//       new BarChart(2021, 'MI', 80),
//     ];
//     var data3 = [
//       new BarChart(2019, 'iPhone', 200),
//       new BarChart(2020, 'Samsung', 300),
//       new BarChart(2021, 'MI', 180),
//     ];

//     var piedata = [
//       new PieChart('2016', 35.8, Color(0xff003f5c)),
//       new PieChart('2017', 8.3, Color(0xffbc5090)),
//       new PieChart('2018', 10.8, Color(0xff58508d)),
//       new PieChart('2019', 15.6, Color(0xffff6361)),
//       new PieChart('2020', 19.2, Color(0xffffa600)),
//       new PieChart('2021', 10.3, Color(0xffdc3912)),
//     ];

//     var linesalesdata = [
//       new Sales(0, 45),
//       new Sales(1, 56),
//       new Sales(2, 55),
//       new Sales(3, 60),
//       new Sales(4, 61),
//       new Sales(5, 70),
//     ];
//     var linesalesdata1 = [
//       new Sales(0, 35),
//       new Sales(1, 46),
//       new Sales(2, 45),
//       new Sales(3, 50),
//       new Sales(4, 51),
//       new Sales(5, 60),
//     ];

//     var linesalesdata2 = [
//       new Sales(0, 20),
//       new Sales(1, 24),
//       new Sales(2, 25),
//       new Sales(3, 40),
//       new Sales(4, 45),
//       new Sales(5, 60),
//     ];

//     _seriesData.add(
//       charts.Series(
//         domainFn: (BarChart barChart, _) => barChart.mobile,
//         measureFn: (BarChart barChart, _) => barChart.quantity,
//         id: '2019',
//         data: data1,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (BarChart barChart, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xff003f5c)),
//       ),
//     );

//     _seriesData.add(
//       charts.Series(
//         domainFn: (BarChart barChart, _) => barChart.mobile,
//         measureFn: (BarChart barChart, _) => barChart.quantity,
//         id: '2020',
//         data: data2,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (BarChart barChart, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xffbc5090)),
//       ),
//     );

//     _seriesData.add(
//       charts.Series(
//         domainFn: (BarChart barChart, _) => barChart.mobile,
//         measureFn: (BarChart barChart, _) => barChart.quantity,
//         id: '2021',
//         data: data3,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (BarChart barChart, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xff58508d)),
//       ),
//     );

//     _seriesPieData.add(
//       charts.Series(
//         domainFn: (PieChart pieChart, _) => pieChart.year,
//         measureFn: (PieChart pieChart, _) => pieChart.sale,
//         colorFn: (PieChart pieChart, _) =>
//             charts.ColorUtil.fromDartColor(pieChart.colorval),
//         id: 'Air Pollution',
//         data: piedata,
//         labelAccessorFn: (PieChart pieChart, _) => '${pieChart.sale}',
//       ),
//     );

//     _seriesLineData.add(
//       charts.Series(
//         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff003f5c)),
//         id: 'Air Pollution',
//         data: linesalesdata,
//         domainFn: (Sales sales, _) => sales.yearval,
//         measureFn: (Sales sales, _) => sales.salesval,
//       ),
//     );
//     _seriesLineData.add(
//       charts.Series(
//         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffbc5090)),
//         id: 'Air Pollution',
//         data: linesalesdata1,
//         domainFn: (Sales sales, _) => sales.yearval,
//         measureFn: (Sales sales, _) => sales.salesval,
//       ),
//     );
//     _seriesLineData.add(
//       charts.Series(
//         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff58508d)),
//         id: 'Air Pollution',
//         data: linesalesdata2,
//         domainFn: (Sales sales, _) => sales.yearval,
//         measureFn: (Sales sales, _) => sales.salesval,
//       ),
//     );
//   }

//   static List<charts.Series<ScattorPlotChart, int>> _createSampleData() {
//     final myFakeDesktopData = [
//       new ScattorPlotChart(52, 0.75, 14.0),
//     ];

//     final myFakeTabletData = [
//       new ScattorPlotChart(45, 0.3, 18.0),
//     ];

//     final myFakeMobileData = [
//       new ScattorPlotChart(56, 0.8, 17.0),
//     ];

//     final myFakeChromebookData = [
//       new ScattorPlotChart(25, 0.6, 13.0),
//     ];

//     final myFakeHomeData = [
//       new ScattorPlotChart(34, 0.5, 15.0),
//     ];

//     final myFakeOtherData = [
//       new ScattorPlotChart(10, 0.25, 15.0),
//       new ScattorPlotChart(12, 0.075, 14.0),
//       new ScattorPlotChart(13, 0.225, 15.0),
//       new ScattorPlotChart(16, 0.03, 14.0),
//       new ScattorPlotChart(24, 0.04, 13.0),
//       new ScattorPlotChart(37, 0.1, 14.5),
//     ];

//     return [ new charts.Series<ScattorPlotChart, int>(
//         id: 'Desktop',
//         colorFn: (ScattorPlotChart sales, _) =>
//         charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (ScattorPlotChart sales, _) => sales.year,
//         measureFn: (ScattorPlotChart sales, _) => sales.sale,
//         radiusPxFn: (ScattorPlotChart sales, _) => sales.radius,
//         data: myFakeDesktopData),
//     new charts.Series<ScattorPlotChart, int>(
//         id: 'Tablet',
//         colorFn: (ScattorPlotChart sales, _) =>
//         charts.MaterialPalette.red.shadeDefault,
//         domainFn: (ScattorPlotChart sales, _) => sales.year,
//         measureFn: (ScattorPlotChart sales, _) => sales.sale,
//         radiusPxFn: (ScattorPlotChart sales, _) => sales.radius,
//         data: myFakeTabletData),
//     new charts.Series<ScattorPlotChart, int>(
//         id: 'Mobile',
//         colorFn: (ScattorPlotChart sales, _) =>
//         charts.MaterialPalette.green.shadeDefault,
//         domainFn: (ScattorPlotChart sales, _) => sales.year,
//         measureFn: (ScattorPlotChart sales, _) => sales.sale,
//         radiusPxFn: (ScattorPlotChart sales, _) => sales.radius,
//         data: myFakeMobileData),
//     new charts.Series<ScattorPlotChart, int>(
//         id: 'Chromebook',
//         colorFn: (ScattorPlotChart sales, _) =>
//         charts.MaterialPalette.purple.shadeDefault,
//         domainFn: (ScattorPlotChart sales, _) => sales.year,
//         measureFn: (ScattorPlotChart sales, _) => sales.sale,
//         radiusPxFn: (ScattorPlotChart sales, _) => sales.radius,
//         data: myFakeChromebookData),
//     new charts.Series<ScattorPlotChart, int>(
//         id: 'Home',
//         colorFn: (ScattorPlotChart sales, _) =>
//         charts.MaterialPalette.indigo.shadeDefault,
//         domainFn: (ScattorPlotChart sales, _) => sales.year,
//         measureFn: (ScattorPlotChart sales, _) => sales.sale,
//         radiusPxFn: (ScattorPlotChart sales, _) => sales.radius,
//         data: myFakeHomeData),
//     new charts.Series<ScattorPlotChart, int>(
//         id: 'Other',
//         colorFn: (ScattorPlotChart sales, _) =>
//         charts.MaterialPalette.gray.shadeDefault,
//         domainFn: (ScattorPlotChart sales, _) => sales.year,
//         measureFn: (ScattorPlotChart sales, _) => sales.sale,
//         radiusPxFn: (ScattorPlotChart sales, _) => sales.radius,
//         data: myFakeOtherData),];
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _seriesData = [];
//     _seriesPieData = [];
//     _seriesLineData = [];
//     _createSampleData();
//     _generateData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             bottom: TabBar(labelColor: Colors.black,
//               indicatorColor: Colors.black,
//               tabs: [
//                 Tab(text: "Bar Graph"),
//                 Tab(text: "Pie Chart"),
//                 Tab(text: "Line Chart"),
//                 Tab(text: "Scatter Plot Charts"),
//               ],
//             ),
//             title: Text('Graph And Charts', style: TextStyle(color: Colors.black)),
//           ),
//           body: TabBarView(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   child: Center(
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           'Mobile Sale Particular Company in Year',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//                         Expanded(
//                           child: charts.BarChart(
//                             _seriesData,
//                             animate: true,
//                             barGroupingType: charts.BarGroupingType.grouped,
//                             behaviors: [new charts.SeriesLegend(
//                               position: charts.BehaviorPosition.top,
//                               outsideJustification: charts.OutsideJustification.endDrawArea,
//                               horizontalFirst: false,
//                               desiredMaxRows: 6,
//                               cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
//                               entryTextStyle: charts.TextStyleSpec(
//                                   color: charts.MaterialPalette.purple.shadeDefault,
//                                   fontFamily: 'Georgia',
//                                   fontSize: 11),
//                             )],
//                             animationDuration: Duration(seconds: 5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   child: Center(
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           'Mobile Sale in Year',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//                         SizedBox(height: 10.0,),
//                         Expanded(
//                           child: charts.PieChart(
//                               _seriesPieData,
//                               animate: true,
//                               animationDuration: Duration(seconds: 5),
//                               behaviors: [
//                                 new charts.DatumLegend(position: charts.BehaviorPosition.top,
//                                   outsideJustification: charts.OutsideJustification.endDrawArea,
//                                   horizontalFirst: false,
//                                   desiredMaxRows: 6,
//                                   cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
//                                   entryTextStyle: charts.TextStyleSpec(
//                                       color: charts.MaterialPalette.purple.shadeDefault,
//                                       fontFamily: 'Georgia',
//                                       fontSize: 11),
//                                 )
//                               ],
//                               defaultRenderer: new charts.ArcRendererConfig(
//                                   //arcWidth: 100,
//                                   arcRendererDecorators: [
//                                     new charts.ArcLabelDecorator(
//                                         labelPosition: charts.ArcLabelPosition.inside)
//                                   ])),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   child: Center(
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           'Sales for the first 5 years',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//                         Expanded(
//                           child: charts.LineChart(
//                               _seriesLineData,
//                               defaultRenderer: new charts.LineRendererConfig(
//                                   includeArea: true, stacked: true),
//                               animate: true,
//                               animationDuration: Duration(seconds: 5),
//                               behaviors: [
//                                 new charts.ChartTitle('Years',
//                                     behaviorPosition: charts.BehaviorPosition.bottom,
//                                     titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
//                                 new charts.ChartTitle('Sales',
//                                     behaviorPosition: charts.BehaviorPosition.start,
//                                     titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
//                                 new charts.ChartTitle('Departments',
//                                   behaviorPosition: charts.BehaviorPosition.end,
//                                   titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
//                                 )
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   child: Center(
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           'Mobile Sale Particular Company in Year',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//                         Expanded(
//                           child: new charts.ScatterPlotChart(seriesList,
//                             // Set up a bucketing axis that will place all values below 0.1 (10%)
//                             // into a bucket at the bottom of the chart.
//                             //
//                             // Configure a tick count of 3 so that we get 100%, 50%, and the
//                             // threshold.
//                             primaryMeasureAxis: new charts.BucketingAxisSpec(
//                             threshold: 0.1,
//                             tickProviderSpec: new charts.BucketingNumericTickProviderSpec(
//                             desiredTickCount: 3)),
//                             // Add a series legend to display the series names.
//                             behaviors: [
//                             new charts.SeriesLegend(position: charts.BehaviorPosition.end),
//                             ],
//                             animate: animate),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BarChart {
//   String mobile;
//   int year;
//   int quantity;

//   BarChart(this.year, this.mobile, this.quantity);
// }

// class PieChart {
//   String year;
//   double sale;
//   Color colorval;

//   PieChart(this.year, this.sale, this.colorval);
// }

// class Sales {
//   int yearval;
//   int salesval;

//   Sales(this.yearval, this.salesval);
// }

// class ScattorPlotChart {
//   final int year;
//   final double sale;
//   final double radius;

//   ScattorPlotChart(this.year, this.sale, this.radius);
// }
