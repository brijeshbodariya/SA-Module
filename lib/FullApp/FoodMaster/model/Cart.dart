import 'dart:convert';

import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';

class Cart {
  int id;
  String restaurantid;
  String userid;
  String itemid;
  String useritemid;
  String userresid;
  String qty;
  String variantid;
  String extrasSelected;
  String perprice;
  String totalprice;
  String extradesc;
  String extraids;
  String itemname;
  String itemimage;
  String itemprice;
  Item item;
  double extrasprice;
  List<Extras> extraslist;

  Cart({
    this.id,
    this.restaurantid,
    this.userid,
    this.itemid,
    this.useritemid,
    this.userresid,
    this.qty,
    this.variantid,
    this.extrasSelected,
    this.perprice,
    this.totalprice,
    this.extradesc,
    this.extraids,
    this.itemname,
    this.itemimage,
    this.itemprice,
    this.item,
    this.extraslist,
    this.extrasprice,
  });

  /* Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantid': restaurantid,
      'userid': userid,
      'itemid': itemid,
      'useritemid': useritemid,
      'userresid': userresid,
      'qty': qty,
      'variantid': variantid,
      'extrasSelected': extrasSelected,
      'perprice': perprice,
      'totalprice': totalprice,
      'extradesc': extradesc,
      'extraids': extraids,
      'itemname': itemname,
      'itemimage': itemimage,
      'itemprice': itemprice,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cart(
      id: map['id'],
      restaurantid: map['restaurantid'],
      userid: map['userid'],
      itemid: map['itemid'],
      useritemid: map['useritemid'],
      userresid: map['userresid'],
      qty: map['qty'],
      variantid: map['variantid'],
      extrasSelected: map['extrasSelected'],
      perprice: map['perprice'],
      totalprice: map['totalprice'],
      extradesc: map['extradesc'],
      extraids: map['extraids'],
      itemname: map['itemname'],
      itemimage: map['itemimage'],
      itemprice: map['itemprice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));*/
}
