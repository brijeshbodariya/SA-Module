import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:share/share.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Quotes/Helper/component.dart';
import 'package:smartkit/FullApp/Quotes/Helper/page_transformer.dart';

import '../QuotesMain.dart';

class QuotePage extends StatefulWidget {
  QuotePage({
    Key key,
  }) : super(key: key);

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  List quoteList = [
    {'image': "https://smartkit.wrteam.in/smartkit/images/back6.jpg", 'quote': "Be yourself; everyone else is already taken.", 'auth_name': "Oscar Wilde"},
    {
      'image': "https://smartkit.wrteam.in/smartkit/images/back8.jpg",
      'quote': "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
      'auth_name': "Marilyn Monroe"
    },
  ];
  String quote, author;
  PageController pageController;
  int curSelect;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, true);
        },
        child: Scaffold(
          key: _scaffoldkey,
          floatingActionButton: getFloatingBtn(),
          backgroundColor: Colors.pink[50],
          appBar: AppBar(
            title: Text(appName),
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [quotes2, quotes3], stops: [0, 1])),
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Center(
                  child: SizedBox.fromSize(
                    size: const Size.fromHeight(500.0),
                    child: PageTransformer(
                      pageViewBuilder: (context, visibilityResolver) {
                        return PageView.builder(
                          controller: //pageController,
                              pageController = PageController(
                            initialPage: 0,
                            viewportFraction: 0.85,
                          ),
                          onPageChanged: onPageChanged,
                          itemCount: quoteList.length,
                          itemBuilder: (context, index) {
                            final pageVisibility = visibilityResolver.resolvePageVisibility(index);
                            return new ComponentRow(quoteList[index]['quote'], quoteList[index]['auth_name'], quoteList[index]['image'], pageVisibility);
                          },
                        );
                      },
                    ),
                  ),
                )),
                //  ad_widget()
              ],
            ),
          ),
        ));
  }

  void onPageChanged(int value) {
    print('VALUE: $value');
    if (this.mounted) {
      setState(() {
        curSelect = value;

        this.quote = quoteList[value]['quote'];
        this.author = quoteList[value]['auth_name'];
      });
    }
  }

  Widget getFloatingBtn() {
    return SpeedDial(
      // both default to 16
      marginEnd: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: quotes2,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.content_copy,
              color: quotes2,
            ),
            backgroundColor: Colors.white,
            label: 'Copy',
            //labelStyle: TextTheme(fontSize: 18.0),
            onTap: () {
              // if (quote == null) curSelect = widget.pos;
              // quoteList[curSelect]['quote'];
              Clipboard.setData(new ClipboardData(text: quoteList[curSelect]['quote']));
              // showSnackBar();
            }),
        SpeedDialChild(
          child: Icon(
            Icons.share,
            color: quotes2,
          ),
          backgroundColor: Colors.white,
          label: 'Share',
          onTap: () => {
            {this.quote = quoteList[curSelect]['quote'], this.author = quoteList[curSelect]['auth_name']},
            Share.share(quote + "\n" + "-" + author + "\n" + "Share from Quotes")
          },
        ),
      ],
    );
  }
}
