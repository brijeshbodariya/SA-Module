import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Widget/Dialog/Flutter_Rating_Bar.dart';

import 'Helper/E_Commerce_Model.dart';

class E_Commerce_3 extends StatefulWidget {
  @override
  _E_Commerce_3State createState() => _E_Commerce_3State();
}

class _E_Commerce_3State extends State<E_Commerce_3> {
  List<E_Commerce_Model> listCat;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    var elist = [
      {
        "id": "17",
        "category_name": "Clothes",
        "subcategory_name": "Formal",
        "title": "test",
        "description": "test",
        "images": ["https://smartkit.wrteam.in/smartkit/images/shoes1.jpg"],
        "price": "50000",
        "rating": "4",
        "sales_price": "100000",
        "product_variation": {
          "weight": ["50g", "200g"],
          "size": ["xs", "small"],
          "color": ["red", "black"]
        },
        "date_created": "20-09-2019 11:09:40"
      },
      {
        "id": "16",
        "category_name": "Shoes",
        "subcategory_name": "Puma",
        "title": "Shoes",
        "description": "Material Type: Mesh\r\nLifestyle: Casual\r\nClosure Type: Lace-Up\r\nToe Style: Round Toe\r\nWarranty Type: Manufacturer",
        "images": ["https://smartkit.wrteam.in/smartkit/images/158068146_15456509701_large.jpg", "https://smartkit.wrteam.in/smartkit/images/Plus-Size-52-Classic-Black-Men-s-Footwear-Comfortable-Ultra-Light-Shoes-Men-Shoes-No-Yeezie.jpg_640x640.jpg"],
        "price": "3000",
        "rating": "3",
        "sales_price": "2000",
        "product_variation": {
          "weight": ["50g", "100g"],
          "size": ["midium", "large"],
          "color": ["red", "blue"]
        },
        "date_created": "19-09-2019 10:09:13"
      },
      {
        "id": "15",
        "category_name": "Mobile",
        "subcategory_name": "Xiomi",
        "title": "Xiomi A",
        "description":
            "6.0\" TN,854*480 ,5 point touch pannel Display ,OPERATING SYSTEM- Android 9.0 \r\n4G Volte High Speed internet Connectivity , 1.3 GHz Quad core Processor, 4 GB RAM and 64GB Internal memory which can be expandable upto 128GB through SD card.\r\n48MP Rear camera with 15MP front camera and 5200mAh Li-ion Battery",
        "images": ["https://smartkit.wrteam.in/smartkit/images/phone.jpg", "https://smartkit.wrteam.in/smartkit/images/phone2.jpg", "https://smartkit.wrteam.in/smartkit/images/phone3.jpg"],
        "price": "15000",
        "rating": "5",
        "sales_price": "14000",
        "product_variation": {
          "weight": ["50g"],
          "size": ["midium"],
          "color": ["black"]
        },
        "date_created": "19-09-2019 10:09:16"
      },
      {
        "id": "14",
        "category_name": "Shoes",
        "subcategory_name": "Bata",
        "title": "MTV Stylish Round 10",
        "description":
            "Size Map: Medium\r\nFrame size: Lens width - 52 mm, nose-bridge: 23 mm, temple length: 135 mm\r\n6 Months on manufacturing defects\r\n100% UV protected\r\nPurple colored frame with purple temple\r\nPlastic frame\r\nBrown colored Polycarbonate lens\r\nIdeal for: Men and Women\r\n",
        "images": ["https://smartkit.wrteam.in/smartkit/images/goggles1.jpg", "https://smartkit.wrteam.in/smartkit/images/goggle2.jpg", "https://smartkit.wrteam.in/smartkit/images/goggle3.jpg"],
        "price": "500",
        "rating": "5",
        "sales_price": "400",
        "product_variation": {
          "weight": ["500g"],
          "size": ["small", "midium", "large"],
          "color": ["red", "blue", "black"]
        },
        "date_created": "18-09-2019 16:09:18"
      }
    ];
    listCat = (elist).map((data) => new E_Commerce_Model.fromJson(data)).toList();

    return Scaffold(
        appBar: AppBar(
          title: new Text('E-Commerce Style 3',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: new ListView.builder(
            itemCount: listCat.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              int pi = int.parse(listCat[index].price);
              int selPrice = int.parse(listCat[index].sale_price);
              int diff = pi - selPrice;

              String per = (diff * 100 / pi).toStringAsFixed(2);

              String price = '\$${listCat[index].price}';
              return Stack(children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 15,
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: listCat[index].imgs[0],
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  listCat[index].title,
                                  style: Theme.of(context).textTheme.subtitle2,
                                  maxLines: 1,
                                ),
                              ),
                              FlutterRatingBar(
                                initialRating: 3,
                                fillColor: Colors.amber,
                                borderColor: Colors.amber,
                                allowHalfRating: true,
                                itemSize: 15,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('$per % Off'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(price, style: Theme.of(context).textTheme.subtitle1),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite),
                        ),
                      ]),
                ),
              ]);
            }));
  }
}
