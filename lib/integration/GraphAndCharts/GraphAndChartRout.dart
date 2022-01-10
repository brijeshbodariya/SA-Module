import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';
import 'BarGraphActivity.dart';
import 'ComboChartActivity.dart';
import 'DonutChartActivity.dart';
import 'GroupBarGraphActivity.dart';
import 'HorizontalBarChartActivity.dart';
import 'LineChartActivity.dart';
import 'PieChartActivity.dart';
import 'RtlLineChartActivity.dart';
import 'ScatterPlotChartActivity.dart';
import 'TimeSeriesChartActivity.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';

class GraphAndChartRout extends StatefulWidget {
  GraphAndChartRout({Key key}) : super(key: key);

  @override
  GraphAndChartRoutState createState() => new GraphAndChartRoutState();
}

class GraphAndChartRoutState extends State<GraphAndChartRout> {
  List wrNewComponents = [
    {
      'route': BarGraphActivity(),
      'title': "Bar Graph",
    },
    {
      'route': GroupBarGraphActivity(),
      'title': "Group Bar Graph",
    },
    {
      'route': HorizontalBarChartActivity(),
      'title': "Horizontal Bar Graph",
    },
    {
      'route': PieChartActivity(),
      'title': "Pie Chart",
    },
    {
      'route': DonutChartActivity(),
      'title': "Donut Chart",
    },
    {
      'route': LineChartActivity(),
      'title': "Line Chart",
    },
    {
      'route': TimeSeriesChartActivity(),
      'title': "Time Series Chart",
    },
    {
      'route': RtlLineChartActivity(),
      'title': "Rtl Line Chart",
    },
    {
      'route': ScatterPlotChartActivity(),
      'title': "Scatter Plot Chart",
    },
    {
      'route': ComboChartActivity(),
      'title': "Combo Chart",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Graph And Chart",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),
      ),
      body: ScreenTypeLayout(
        mobile: appWidget(),
        desktop: webWidget(),
      ),
    );
  }

  Widget appWidget() {
    return ListView.builder(
        itemCount: wrNewComponents.length,
        itemBuilder: (BuildContext context, int index) {
          Color bg = tilecolor[index % tilecolor.length];
          Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
          Color textcolor = tiletextcolor[index % tiletextcolor.length];
          getletter(wrNewComponents[index]['title']);

          return Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: ListTileUI(
              iconTitle: strs,
              title: wrNewComponents[index]['title'],
              color: bg,
              iconbg: iconbg,
              textcolor: textcolor,
              ontap: wrNewComponents[index]['route'],
            ),
          );
        });
  }

  Widget webWidget() {
    return GridView.count(
      crossAxisCount: 6,
      children: List.generate(wrNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => wrNewComponents[index]['route']),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: iconbg,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 130,
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  alignment: Alignment.center,
                  child: Text(
                    strs,
                    style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textcolor,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrNewComponents[index]['title'],
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
