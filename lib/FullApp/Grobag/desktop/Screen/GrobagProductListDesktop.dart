import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/desktop/Screen/GrobagProductDetailDesktop.dart';

class GrobagProducListDesktop extends StatefulWidget {
  final String title;

  const GrobagProducListDesktop({Key key, this.title}) : super(key: key);
  @override
  _GrobagProducListDesktopState createState() => _GrobagProducListDesktopState();
}

class _GrobagProducListDesktopState extends State<GrobagProducListDesktop> {
  ChoiceChip choiceChip;
  List<int> _selectedIndex = [0, 1, 5];
  List itemList = [
    {'tag': "4", 'img': "https://smartkit.wrteam.in/smartkit/grobag/brinjal.png", 'name': "Brinjal", 'descprice': "1700", 'price': "2000", 'qty': '250 gm', 'isFav': true},
    {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/cauliflower.png", 'name': "Cauliflower", 'descprice': "25", 'price': "2200", 'qty': '250 gm', 'isFav': true},
    {'tag': "4", 'img': "https://smartkit.wrteam.in/smartkit/grobag/strawberries.png", 'name': "Starwberries", 'descprice': "1700", 'price': "2000", 'qty': '250 gm', 'isFav': true},
    {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/kiwi.png", 'name': "Fresh Kiwi", 'descprice': "25", 'price': "2200", 'qty': '250 gm', 'isFav': true},
    {'tag': "1", 'img': "https://smartkit.wrteam.in/smartkit/grobag/banana.png", 'name': "Banana", 'descprice': "25", 'price': "50", 'qty': "1 kg", 'isFav': true},
    {'tag': "2", 'img': "https://smartkit.wrteam.in/smartkit/grobag/apple.png", 'name': "Shimla Apple", 'descprice': "1000", 'price': "1200", 'qty': '500 gm', 'isFav': true},
    {'tag': "3", 'img': "https://smartkit.wrteam.in/smartkit/grobag/watermelon.png", 'name': "Yummy Watermelon", 'descprice': "1300", 'price': "1400", 'qty': '2 kg', 'isFav': true},
    {'tag': "8", 'img': "https://smartkit.wrteam.in/smartkit/grobag/red_chili.png", 'name': "Spicy Red Chili", 'descprice': "1300", 'price': "1400", 'qty': '1 kg', 'isFav': true},
    {'tag': "6", 'img': "https://smartkit.wrteam.in/smartkit/grobag/mangosteens.png", 'name': "Mangosteens", 'descprice': "2500", 'price': "3500", 'qty': '250 gm', 'isFav': true},
    {'tag': "7", 'img': "https://smartkit.wrteam.in/smartkit/grobag/peas.png", 'name': "Green Peas", 'descprice': "1000", 'price': "1000", 'qty': '250 gm', 'isFav': true},
    {'tag': "9", 'img': "https://smartkit.wrteam.in/smartkit/grobag/muskmelon.png", 'name': "Muskmelon", 'descprice': "1700", 'price': "2000", 'qty': '500 gm', 'isFav': true},
    {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/kiwi.png", 'name': "Fresh Kiwi", 'descprice': "25", 'price': "2200", 'qty': '250 gm', 'isFav': true},
  ];

  List<String> attList = ['Quantity', 'Type'];

  List valList = [
    [
      '100 gm',
      '250 gm',
      '500 gm',
      '1 kg',
      '5 kg',
      '10 kg',
      '1 L',
      '2 L',
      '5 L',
    ],
    ['Fruits', 'Vegetables', 'Backery', 'Soft Drinks', 'Juice']
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: widget.title,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: MediaQuery.of(context).size.width * 0.49, child: OutlinedButton(onPressed: showFilter, child: Text('Filter'))),
              Container(
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: OutlinedButton(
                    child: Text('Sort'),
                    onPressed: sortDialog,
                  )),
            ],
          ),
          Expanded(
            child: GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 0.8,
                physics: BouncingScrollPhysics(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                children: List.generate(
                  itemList.length,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GrobagProductDetailDesktop(
                                        pos: 0,
                                      )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CachedNetworkImage(
                                      imageUrl: itemList[index]['img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: new BoxDecoration(
                                          color: secondary.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Icon(
                                          itemList[index]['isFav'] ? Icons.favorite : Icons.favorite_border,
                                          size: 15,
                                          color: secondary,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          itemList[index]['isFav'] = !itemList[index]['isFav'];
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              itemList[index]['qty'],
                              style: Theme.of(context).textTheme.caption.copyWith(
                                    color: secondary,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              itemList[index]['name'],
                              style: Theme.of(context).textTheme.subtitle2.copyWith(
                                    color: fontColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ " + itemList[index]['descprice'],
                                  style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Spacer(),
                                new Container(
                                  margin: EdgeInsets.only(bottom: 5, right: 5),
                                  width: 24,
                                  height: 24,
                                  decoration: new BoxDecoration(color: primary.withOpacity(0.3), borderRadius: BorderRadius.circular(6)),
                                  child: Icon(
                                    Icons.add,
                                    size: 12,
                                    color: primary,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  showFilter() {
    RangeValues values = RangeValues(20, 80);
    RangeLabels labels = RangeLabels('1', "100");

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.close,
                            color: primary,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                        Text(
                          'Filter',
                          style: Theme.of(context).textTheme.headline6.copyWith(color: fontColor, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Reset',
                            style: TextStyle(color: primary),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Text('Price Range'),
                  RangeSlider(
                      divisions: 5,
                      activeColor: secondary,
                      inactiveColor: secondary.withOpacity(0.3),
                      min: 1,
                      max: 100,
                      values: values,
                      labels: labels,
                      onChanged: (value) {
                        print("START: ${value.start}, End: ${value.end}");
                        setState(() {
                          values = value;
                          labels = RangeLabels("${value.start.toInt().toString()}\$", "${value.end.toInt().toString()}\$");
                        });
                      }),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: attList.length,
                    itemBuilder: (context, index) {
                      List<Widget> chips = [];

                      for (int i = 0; i < valList[index].length; i++) {
                        choiceChip = ChoiceChip(
                          selected: _selectedIndex.length > index ? _selectedIndex[index] == i : false,
                          label: Text(valList[index][i], style: TextStyle(color: white)),
                          selectedColor: primary,
                          disabledColor: primary.withOpacity(0.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          onSelected: (bool selected) {},
                        );

                        chips.add(Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: choiceChip));
                      }
                      return chips.length > 0
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    attList[index],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  new Wrap(
                                    children: chips.map<Widget>((Widget chip) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: chip,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            )
                          : Container();
                    },
                  ),
                ],
              ),
            );
          });
        });
  }

  void sortDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
            ),
            child: new AlertDialog(
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                contentPadding: const EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: EdgeInsetsDirectional.only(top: 19.0, bottom: 16.0),
                        child: Text(
                          'Sort By',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                    Divider(),
                    TextButton(child: Text('Top Rated', style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor)), onPressed: () {}),
                    Divider(),
                    TextButton(
                        child: Text('Newest First', style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor)),
                        onPressed: () {
                          Navigator.pop(context, 'option 1');
                        }),
                    Divider(),
                    TextButton(
                        child: Text(
                          'Oldest First',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context, 'option 2');
                        }),
                    Divider(),
                    TextButton(
                        child: new Text(
                          'Price - Low to High',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context, 'option 3');
                        }),
                    Divider(),
                    Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 5.0),
                        child: TextButton(
                            child: new Text(
                              'Price - High to Low',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor),
                            ),
                            onPressed: () {
                              Navigator.pop(context, 'option 4');
                            })),
                  ]),
                )),
          );
        });
  }
}
