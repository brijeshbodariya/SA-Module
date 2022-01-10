// import 'package:flutter/material.dart';

// import 'Card1.dart';
// import 'Card2.dart';
// import 'Card3.dart';

// class WRCards extends StatefulWidget {
//   WRCards({Key key}) : super(key: key);

//   @override
//   _WRCardsState createState() => _WRCardsState();
// }

// class _WRCardsState extends State<WRCards> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF5F5F5),
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(56),
//           child: WRCustAppBar(
//             title: "Flutter UI Component",
//           )),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
//               child: Text(
//                 "WrCard1",
//                 style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 3, bottom: 3, left: 16),
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 width: 70,
//                 height: 3,
//                 decoration: BoxDecoration(
//                   color: Colors.pink[200],
//                   // color: Color(0xff5AD2F1).withOpacity(0.50),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(5),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 15, bottom: 0, top: 20, right: 15),
//               height: MediaQuery.of(context).size.height / 2 - 90,
//               child: ListView(physics: ScrollPhysics(), scrollDirection: Axis.horizontal, shrinkWrap: true, children: [
//                 WrCard1(
//                   image: "https://smartkit.wrteam.in/smartkit/images/image_1.png",
//                   title: "Aloe vera",
//                   country: "Plants",
//                   price: 240,
//                   press: () {},
//                 ),
//                 WrCard1(
//                   image: "https://smartkit.wrteam.in/smartkit/images/image_2.png",
//                   title: "Aloes",
//                   country: "Plant",
//                   price: 340,
//                   press: () {},
//                 ),
//                 WrCard1(
//                   image: "https://smartkit.wrteam.in/smartkit/images/image_3.png",
//                   title: "Neofinetia",
//                   country: "Plant",
//                   price: 440,
//                   press: () {},
//                 ),
//               ]),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
//               child: Text(
//                 "WrCard2",
//                 style: TextStyle(fontSize: 20.0, color: Colors.pink[300], fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 3, bottom: 3, left: 16),
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 width: 70,
//                 height: 3,
//                 decoration: BoxDecoration(
//                   color: Color(0xff5AD2F1),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(5),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
//               child: WrCard2(
//                 image: "https://smartkit.wrteam.in/smartkit/imagesmsmartkit.000webhostapp.com/smartkit/images/facebook.jpg",
//                 title: "Lamborghini",
//                 isFav: false,
//                 raters: 14,
//                 rating: 5.4,
//                 onTap: () {},
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
//               child: Text(
//                 "WrCard3",
//                 style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 3, bottom: 3, left: 16),
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 width: 70,
//                 height: 3,
//                 decoration: BoxDecoration(
//                   color: Colors.pink[200],
//                   // color: Color(0xff5AD2F1).withOpacity(0.50),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(5),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 15, bottom: 0, top: 20, right: 15),
//               height: MediaQuery.of(context).size.height / 2,
//               child: ListView(physics: ScrollPhysics(), scrollDirection: Axis.horizontal, shrinkWrap: true, children: [
//                 WrCard3(
//                   width: MediaQuery.of(context).size.width / 2,
//                   imgheight: MediaQuery.of(context).size.width / 2,
//                   image: "https://smartkit.wrteam.in/smartkit/images/Nikereak3.jpg",
//                   title: "Nike reak",
//                   isFav: false,
//                   raters: 50,
//                   rating: 3.5,
//                   onTap: () {},
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 WrCard3(
//                   width: MediaQuery.of(context).size.width / 2,
//                   imgheight: MediaQuery.of(context).size.width / 2,
//                   image: "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
//                   title: "Nike Air Max",
//                   isFav: true,
//                   raters: 50,
//                   rating: 4.5,
//                   onTap: () {},
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 WrCard3(
//                   width: MediaQuery.of(context).size.width / 2,
//                   imgheight: MediaQuery.of(context).size.width / 2,
//                   image: "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
//                   title: "Metcon",
//                   isFav: false,
//                   raters: 50,
//                   rating: 2.5,
//                   onTap: () {},
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
