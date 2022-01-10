import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagCheckoutTablet.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagHomeTablet.dart';

class GrobagCartTablet extends StatefulWidget {
  @override
  _GrobagCartTabletState createState() => _GrobagCartTabletState();
}

class _GrobagCartTabletState extends State<GrobagCartTablet> {
  double disPrice = 10, oriPrice = 1000, delCharge = 100, totalPrice = 890;
  List cartList = [
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-a.png", 'name': "Jasmine Rice Unmilled", 'descprice': "45", 'price': "50f", 'qty': '250 gm', 'cartCount': 1},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-b.png", 'name': "Garden Freshly Roasted Salted Cashew Nuts", 'descprice': "250", 'price': "500", 'qty': '250 gm', 'cartCount': 1},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-c.png", 'name': "Good Fermented and Sun Dried Cocoa Beans", 'descprice': "25", 'price': "50", 'qty': "1 kg", 'cartCount': 1},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-d.png", 'name': "American Sweet Corn Unpeeled", 'descprice': "1000", 'price': "1200", 'qty': '500 gm', 'cartCount': 1},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-e.png", 'name': "Sprouting Seeds Mung Beans", 'descprice': "1300", 'price': "1400", 'qty': '2 kg', 'cartCount': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrobagAppbar(title: 'Cart'),
        body: cartList.length == 0
            ? cartEmpty()
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: cartList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listItem(index);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 5.0, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Total Price',
                        ),
                        Spacer(),
                        Text("\$" + "$oriPrice")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Delivery Charge",
                        ),
                        Spacer(),
                        Text("\$" + " $delCharge")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Discount",
                        ),
                        Spacer(),
                        Text('\$' + " $disPrice")
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Grand Total',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          '\$' + " $totalPrice",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: new Container(
                      margin: EdgeInsets.all(20),
                      height: 48,
                      decoration: new BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text("CHECKOUT",
                            style: TextStyle(
                              color: white,
                            )),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GrobagCheckoutTablet()));
                    },
                  ),
                ],
              ));
  }

  cartEmpty() {
    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [noCartImage(context), noCartText(context), noCartDec(context), shopNow()]),
      ),
    );
  }

  Widget listItem(int index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          cartList.removeAt(index);
        });
      },
      key: Key(cartList[index]["name"]),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: cartList[index]["img"],
                height: 80,
                width: 80,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cartList[index]["qty"],
                        style: TextStyle(color: secondary),
                      ),
                      Text(
                        cartList[index]["name"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontLight, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  margin: EdgeInsetsDirectional.only(end: 8, top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: primary,
                                  ),
                                  decoration: BoxDecoration(color: primary.withOpacity(0.2), borderRadius: BorderRadius.all(Radius.circular(5))),
                                ),
                                onTap: () {
                                  if (cartList[index]["cartCount"] != 1)
                                    setState(() {
                                      cartList[index]["cartCount"] = cartList[index]["cartCount"] - 1;
                                    });
                                },
                              ),
                              Text("${cartList[index]["cartCount"]}"),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  margin: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    color: primary,
                                  ),
                                  decoration: BoxDecoration(color: primary.withOpacity(0.2), borderRadius: BorderRadius.all(Radius.circular(5))),
                                ),
                                onTap: () {
                                  setState(() {
                                    cartList[index]["cartCount"] = cartList[index]["cartCount"] + 1;
                                  });
                                },
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "\$" + cartList[index]["descprice"] + "  ",
                                style: Theme.of(context).textTheme.subtitle1.copyWith(color: primary),
                              ),
                              Text(
                                "\$" + cartList[index]["price"],
                                style: Theme.of(context).textTheme.subtitle2.copyWith(color: lightBack, decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  noCartImage(BuildContext context) {
    return SvgPicture.network(
      'https://smartkit.wrteam.in/smartkit/grobag/emptycart.svg',
    );
  }

  noCartText(BuildContext context) {
    return Container(padding: EdgeInsets.only(top: 20), child: Text("Your Cart Is Empty", style: Theme.of(context).textTheme.headline5.copyWith(color: primary, fontWeight: FontWeight.normal)));
  }

  noCartDec(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: Text("Looking like you haven't added anything to your cart yet",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: fontLight,
                fontWeight: FontWeight.normal,
              )),
    );
  }

  shopNow() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: CupertinoButton(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 45,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('Shop Now', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6.copyWith(color: white, fontWeight: FontWeight.normal))),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => GrobagHomeTablet()), ModalRoute.withName('/'));
        },
      ),
    );
  }
}
