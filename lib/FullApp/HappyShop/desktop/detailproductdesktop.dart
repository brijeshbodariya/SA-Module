import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopString.dart';
import 'package:smartkit/FullApp/HappyShop/Screen/HappyShopCart.dart';
import 'package:smartkit/FullApp/HappyShop/Screen/HappyShopProductPriview.dart';

class ProductDetailsDesktop extends StatelessWidget {
  const ProductDetailsDesktop({Key key, this.listwidget, this.tag, this.imgurl}) : super(key: key);
  final List<Widget> listwidget;
  final String tag;
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          splashColor: primary.withOpacity(0.2),
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  pageBuilder: (_, __, ___) => HappyShopProductPreview(),
                ));
          },
          child: Stack(
            children: <Widget>[
              Hero(
                tag: tag,
                child: CachedNetworkImage(
                  imageUrl: imgurl,
                  // fit: BoxFit.fill,
                ),
              ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF333333).withOpacity(0.5),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0xFF333333).withOpacity(0.5),
                                ),
                              ),
                              onTap: () {}),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            child: new Stack(children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Color(0xFF333333).withOpacity(0.5),
                                  size: 26,
                                ),
                              ),
                              (CUR_CART_COUNT != null && CUR_CART_COUNT.isNotEmpty && CUR_CART_COUNT != "0")
                                  ? new Positioned(
                                      top: 0.0,
                                      right: 5.0,
                                      bottom: 15,
                                      child: Container(
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                          child: new Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: new Text(
                                                CUR_CART_COUNT,
                                                style: TextStyle(fontSize: 8, color: Colors.white),
                                              ),
                                            ),
                                          )),
                                    )
                                  : Container()
                            ]),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HappyShopCart(),
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
        // _slider(),
        SizedBox(
          height: 5.0,
        ),
        Column(
          children: listwidget,
        )
      ],
    );
  }
}
