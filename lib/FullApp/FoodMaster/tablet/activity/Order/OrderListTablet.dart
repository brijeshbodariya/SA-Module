import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/DesignConfig.dart';

import 'package:smartkit/FullApp/FoodMaster/tablet/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Address.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Order.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/activity/Order/OrderDetailPageTablet.dart';

Order selectedorder;
int selectedorderindex;
List<Order> orderlist;
StreamController<String> orderstreamdata;

class OrderListTablet extends StatefulWidget {
  final dynamic restorant;

  const OrderListTablet({Key key, this.restorant}) : super(key: key);
  @override
  _OrderListStateTablet createState() => _OrderListStateTablet();
}

class _OrderListStateTablet extends State<OrderListTablet> {
  GlobalKey<ScaffoldState> scaffoldKey;
  bool isloadmore = true;
  bool ispageLoading = false;
  List<Status> statuslist = [
    Status(id: 1, name: "Pendding", pivot: Pivot1(createdAt: "2021-02-18T11:50:31.000000Z", userId: 1, statusId: 1, comment: "Its good", orderId: 1)),
    Status(id: 2, name: "Done", pivot: Pivot1(createdAt: "2021-02-18T11:50:31.000000Z", userId: 2, statusId: 2, comment: "good", orderId: 2))
  ];
  Status status;
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    orderlist = [
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg", name: "Bronx VanNest Restorant", address: "6 Yukon Drive Raeford, NC 28376", phone: "1241548784524125"),
          items: Item(id: 1, orderPivot: OrderPivot(qty: 2, extras: "Extra Cheese", itemId: 1, orderId: 1, variantName: "test", variantPrice: 20, vat: 5, vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg", name: "Bronx VanNest Restorant", address: "6 Yukon Drive Raeford, NC 28376", phone: "1241548784524125"),
          items: Item(id: 1, orderPivot: OrderPivot(qty: 2, extras: "Extra Cheese", itemId: 1, orderId: 1, variantName: "test", variantPrice: 20, vat: 5, vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg", name: "Bronx VanNest Restorant", address: "6 Yukon Drive Raeford, NC 28376", phone: "1241548784524125"),
          items: Item(id: 1, orderPivot: OrderPivot(qty: 2, extras: "Extra Cheese", itemId: 1, orderId: 1, variantName: "test", variantPrice: 20, vat: 5, vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_4.jpg", name: "Bronx VanNest Restorant", address: "6 Yukon Drive Raeford, NC 28376", phone: "1241548784524125"),
          items: Item(id: 1, orderPivot: OrderPivot(qty: 2, extras: "Extra Cheese", itemId: 1, orderId: 1, variantName: "test", variantPrice: 20, vat: 5, vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_5.jpg", name: "Bronx VanNest Restorant", address: "6 Yukon Drive Raeford, NC 28376", phone: "1241548784524125"),
          items: Item(id: 1, orderPivot: OrderPivot(qty: 2, extras: "Extra Cheese", itemId: 1, orderId: 1, variantName: "test", variantPrice: 20, vat: 5, vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376"))
    ];
    for (int i = 0; i < statuslist.length; i++) {
      status = statuslist[i];
    }

    setupChannel();
  }

  void setupChannel() {
    orderstreamdata = StreamController<String>();
    orderstreamdata.stream.listen((response) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (orderstreamdata != null && !orderstreamdata.isClosed) orderstreamdata.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.myorders),
        body: Column(children: [
          Expanded(child: orderWidget()),
          Container(
            height: ispageLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ]));
  }

  orderWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: orderlist.length,
        itemBuilder: (context, index) {
          Order order = orderlist[index];
          double totalprice = order.deliveryPrice + order.orderPrice;
          print(order.status);
          return ButtonClickAnimation(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => OrderDetailPageTablet(
                          order: order.id,
                          createAT: order.createdAt,
                          status: order.status,
                          res_name: order.restorant.name,
                          res_id: order.restorant.id,
                          res_add: order.restorant.address,
                          res_ph: order.restorant.phone,
                          res_logom: order.restorant.logom,
                          item_qt: order.items.orderPivot.qty,
                          item_price: order.items.price,
                          item_vat: order.items.orderPivot.vat.toString(),
                          item_vatvalue: order.items.orderPivot.vatvalue,
                          item_variant: order.items.orderPivot.variantName,
                          order_price: order.orderPrice,
                          order_vatValue: order.vatvalue,
                          order_de: order.deliveryPrice)));
            },
            child: Card(
              shape: DesignConfig.setRoundedBorder(ColorsRes.white, 10, false),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorsRes.lightgrey,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: order.restorant.logom,
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "${Constant.getFormatparse(order.createdAt)}\t\t\t\u2022${order.items.id} Items",
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.grey.withOpacity(0.7))),
                            )),
                            Text("${Constant.currencysymbol}$totalprice", style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.green, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        Text(
                          order.restorant.name,
                          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Text(
                                  Constant.getDeliveryMethodName(order.deliveryMethod),
                                  style: Theme.of(context).textTheme.caption.merge(TextStyle()),
                                ),
                                Text(
                                  "\t\u2022\t",
                                  style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey)),
                                ),
                                Text(
                                  order.status.last.name,
                                  style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: Constant.getOrderStatusColor(order.status.last.id))),
                                ),
                              ],
                            )),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: ColorsRes.grey,
                            )
                          ],
                        ),
                      ]),
                    ),
                  ]),
                ]),
              ),
            ),
          );
        });
  }
}
